class Repo < ActiveRecord::Base
  attr_accessible :github_id, :name, :published_at, :url, :html_url, :user_id, :project_id

  belongs_to :user
  belongs_to :project
  has_many :user_repos
  has_many :users, :through => :user_repos

  def parse_repo_trunk
  	JSON.parse(open("#{self.url}/contents?access_token=#{self.user.token}").read)
  end

  def check_if_contributor(current_user)
    contributors = JSON.parse(open("https://api.github.com/repos/#{self.user.name}/#{self.name}/contributors?access_token=#{self.user.token}").read)
    contributors.each { |contributor| return true if contributor["id"].to_s == current_user.github_id }
    false
  end
end
