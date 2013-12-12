class AddOwnerIdToRepos < ActiveRecord::Migration
  def change
    add_column :repos, :owner_id, :integer
  end
end
