class RenameTableUserGroups < ActiveRecord::Migration
  def up
    rename_table :usergroups, :user_groups
  end

  def down
  end
end
