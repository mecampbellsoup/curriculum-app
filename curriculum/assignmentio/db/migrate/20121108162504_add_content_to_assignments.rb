class AddContentToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :content, :text
  end
end
