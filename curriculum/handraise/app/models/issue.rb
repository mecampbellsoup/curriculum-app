class Issue < ActiveRecord::Base
  include AASM
  attr_accessible :description, :status, :title, :answer_id, :aasm_state, :created_at
  attr_reader :answer, :answerer, :issue_creator

  validates :title, :length => { :maximum => 255}

  belongs_to :user
  belongs_to :organization
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :answers, :dependent => :destroy
  has_many :votes, :dependent => :destroy

  # before_create :default_values
  before_create :set_username
  before_update :current_status
  before_update :accept_answer

  def set_username
    self.username = self.user.username
  end

  def self.newest_first
    order('created_at DESC')
  end

  def self.oldest_first
    order('created_at')
  end

  def self.text_search(query)
    if query.present?
      rank = <<-RANK
        ts_rank(to_tsvector(title), plainto_tsquery(#{sanitize(query)})) +
        ts_rank(to_tsvector(description), plainto_tsquery(#{sanitize(query)})) +
        ts_rank(to_tsvector(username), plainto_tsquery(#{sanitize(query)}))
      RANK
      results = where("title @@ :q or description @@ :q or username @@ :q", q: "%#{query}%")
      if results.count > 0
        results.order("#{rank} desc")
      else
        results
      end
    end
  end

  # def self.text_search(query)
  #   if query.present?
  #     where("title @@ :q or description @@ :q", q: query)
  #   else
  #     scoped
  #   end
  # end

  def self.open
    Issue.all - Issue.where(aasm_state: "resolved")
  end

  def self.unresolved
    Issue.where("aasm_state = ? OR aasm_state = ?", "opened", "instructor_asked")
  end

  def instructor_responded?
    answers = self.answers.select{|answer| answer.id }
    !answers.select{|answer| answer.owner.is_instructor }.blank?
  end

  def accept_answer
    if self.answer_accepted?
      self.resolve unless self.resolved?
      # Answer.find(self.answer_id).accepted_answer = true
    end
  end

  def answer_accepted?
    self.answer_id != nil
  end

  def show_answers
    if self.answer_id.nil?
      self.answers.order("votes_count DESC")
    else
      self.answers.where(["id != ?", self.answer_id]).order("votes_count DESC")
    end
  end

  def accepted_answer
    if self.answer_id
      Answer.find(self.answer_id)
    end
  end

  def current_status
    while status_stale?
      self.send(next_event)
    end
    self.aasm_state
  end

  # def answer_accepted?
  #   self.answers.find_by_accepted_answer(true) if self.answers
  # end

  def total_votes
    self.votes_count = votes.sum(:value)
    self.save
    self.votes_count
  end

  def owner
    user
  end

  def is_owner?(current_user)
    current_user == self.user
  end


  def notify_instructor
    Notifier.ping_instructor(self, self.user).deliver
  end

  def clear_answer
    self.answer_id = nil
    self.save
  end

  aasm do
    state :fresh, :initial => true
    state :opened
    state :instructor_asked
    state :resolved

    event :open, :after => :clear_answer do
      transitions :from => [:fresh, :resolved], :to => :opened
    end

    event :ask_instructor, :after => :notify_instructor do
      transitions :from => [:fresh, :opened], :to => :instructor_asked
    end

    event :resolve do
      transitions :from => [:fresh, :opened, :instructor_asked], :to => :resolved
    end
  end

  def change_state(string)
    case string
      when "open"
        self.open!
      when "ask_instructor"
        self.ask_instructor
      when "resolve"
        self.resolve
    end
  end

  def update_from_form(params)
    # @issue_creator = @issue.user

    # if @issue.answer_id
    #   @answerer = Answer.find(@issue.answer_id).user
    #   Notifier.answer_selected(@issue, @issue_creator, @answerer).deliver

    #   @issue.answers.each do |answer|
    #     answer.accepted_answer = false
    #     answer.save
    #   end
    #   @answer = Answer.find(@issue.answer_id)
    #   @answer.accepted_answer = true
    #   @answer.save
    # end

    @issue_creator = self.user

    if self.answer_id
      @answerer = Answer.find(self.answer_id).user
      Notifier.answer_selected(self, @issue_creator, @answerer).deliver
    end

    self.update_attributes(params)
  end

  private

  def next_event
    current_state_index = Issue.aasm_state_names.index(self.aasm_state.to_sym)
    Issue.aasm_event_names[current_state_index]
  end

  def status_stale?
    case self.aasm_state
    when 'fresh'
      self.created_at < 15.minutes.ago
    when 'opened'
      self.created_at < 45.minutes.ago
    when 'instructor_asked'
      false
    when 'resolved'
      false
    end
  end

  def self.aasm_event_names
    self.aasm.events.collect{|k,v| k}
  end

  def self.aasm_state_names
    self.aasm.states.collect{|state| state.name}
  end
end
