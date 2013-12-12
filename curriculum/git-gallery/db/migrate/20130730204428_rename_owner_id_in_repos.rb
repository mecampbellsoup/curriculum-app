class RenameOwnerIdInRepos < ActiveRecord::Migration
  def up
  	rename_column :repos, :owner_id, :user_id
  end

  def down
  	rename_column :repos, :user_id, :owner_id
  end
end
