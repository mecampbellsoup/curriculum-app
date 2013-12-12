class AddForeignKeysforOrg < ActiveRecord::Migration
  def change
    add_column :issues, :organization_id, :integer
    add_column :users, :organization_id, :integer
  end
end
