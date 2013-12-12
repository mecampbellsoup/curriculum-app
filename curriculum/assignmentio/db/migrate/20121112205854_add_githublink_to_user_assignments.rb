class AddGithublinkToUserAssignments < ActiveRecord::Migration
  def change
    add_column :user_assignments, :github_link, :string
  end
end
