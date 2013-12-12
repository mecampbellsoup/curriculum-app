class AddGithubOwnerIdToRepos < ActiveRecord::Migration
  def change
    add_column :repos, :github_owner_id, :integer
  end
end
