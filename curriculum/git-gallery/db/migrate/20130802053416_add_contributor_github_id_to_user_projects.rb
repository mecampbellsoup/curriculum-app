class AddContributorGithubIdToUserProjects < ActiveRecord::Migration
  def change
    add_column :user_projects, :contributor_github_id, :integer
  end
end
