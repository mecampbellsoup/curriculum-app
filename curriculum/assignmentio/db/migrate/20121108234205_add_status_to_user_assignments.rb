class AddStatusToUserAssignments < ActiveRecord::Migration
  def change
    add_column :user_assignments, :user, :string
  end
end
