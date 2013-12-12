class AddNameToUserGroups < ActiveRecord::Migration
  def change
    add_column :Usergroups, :name, :string
  end
end
