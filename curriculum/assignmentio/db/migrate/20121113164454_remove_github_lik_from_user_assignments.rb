class RemoveGithubLikFromUserAssignments < ActiveRecord::Migration
  def up
    remove_column :user_assignments, :github_link
  end
  def down
    add_column :user_assignments, :github_link, :string
  end
end
