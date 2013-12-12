class Answer < ActiveRecord::Base
   attr_accessible :content, :accepted_answer, :user

   has_many :comments, :as => :commentable, :dependent => :destroy
   belongs_to :user
   belongs_to :issue
   has_many :votes

   def total_votes
    self.votes_count = votes.sum(:value)
    self.save
    self.votes_count
  end

   def owner
    user
   end

   def accepted_answer?
      self.issue.answer_id == self.id
   end

end
