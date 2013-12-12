class AddProjectIdToRepos < ActiveRecord::Migration
  def change
    add_column :repos, :project_id, :integer
  end
end
