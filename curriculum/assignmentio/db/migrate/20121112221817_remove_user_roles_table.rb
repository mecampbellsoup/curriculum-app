class RemoveUserRolesTable < ActiveRecord::Migration
  def change
    add_column :users, :role_names, :string

    drop_table :user_roles
    drop_table :roles
  end
end
