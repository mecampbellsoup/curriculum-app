class ProjectTechnology < ActiveRecord::Base
  attr_accessible :project_id, :technology_id

  belongs_to :project
  belongs_to :technology
end