class Comment < ActiveRecord::Base
  attr_accessible :content, :user
  belongs_to :user
  has_many :votes

  belongs_to :commentable, :polymorphic => true

  accepts_nested_attributes_for :votes

  def total_votes
    read_attribute(:total_votes) || votes.sum(:value)
  end

end
