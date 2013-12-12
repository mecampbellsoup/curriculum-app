class DropUserIdFromFeatures < ActiveRecord::Migration
  def change
    remove_column :features, :user_id, :integer
    remove_column :features, :project_id, :integer
  end
end
