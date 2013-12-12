class AddGithubIdToContributors < ActiveRecord::Migration
  def change
    add_column :contributors, :github_id, :integer
  end
end
