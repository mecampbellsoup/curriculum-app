class Vote < ActiveRecord::Base
  attr_accessible :comment_id, :user_id, :value, :answer_id, :issue_id

  belongs_to :comment
  belongs_to :user
  belongs_to :answer
  belongs_to :issue

  # validates_uniqueness_of :comment_id, scope: :user_id
  validates_inclusion_of :value, in: [1, -1]
  validate :ensure_not_author
  validate :ensure_no_double_voting



  private
  def ensure_not_author
    if self.answer
      self.errors.add :user_id, "is the author of the response" if self.answer.user_id == user_id
    else
      self.errors.add :user_id, "is the author of the response" if self.issue.user_id == user_id
    end
  end

  def ensure_no_double_voting
    if self.answer
      total_users_votes_on_answer = Vote.where(:user_id => self.user_id, :answer_id => self.answer_id).sum(:value)
      self.errors.add :user_id, "cannot double vote" unless (total_users_votes_on_answer + self.value).between?(-1, 1)
    else
      total_users_votes_on_issue = Vote.where(:user_id => self.user_id, :issue_id => self.issue_id).sum(:value)
      self.errors.add :user_id, "cannot double vote" unless (total_users_votes_on_issue + self.value).between?(-1, 1)
    end
  end

end




