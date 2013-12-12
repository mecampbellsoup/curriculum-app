class UserProject < ActiveRecord::Base
  attr_accessible :project_id, :user_id, :contributor_github_id
  ## is mass-assigning the contributor_github_id unsafe?

  belongs_to :user
  belongs_to :project

  has_many :features
  
end
