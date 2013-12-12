class AddUserProjectIdToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :user_project_id, :integer
  end
end
