class ChangeColNameInUserAssignments < ActiveRecord::Migration
  def up
    rename_column :user_assignments, :user, :status
  end

  def down
  end
end
