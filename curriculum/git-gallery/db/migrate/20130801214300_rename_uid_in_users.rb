class RenameUidInUsers < ActiveRecord::Migration
  def up
    rename_column :users, :uid, :github_id
  end

  def down
    rename_column :users, :github_id, :uid
  end
end
