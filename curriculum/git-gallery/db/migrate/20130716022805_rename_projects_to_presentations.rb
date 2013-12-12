class RenameProjectsToPresentations < ActiveRecord::Migration
  def up
    rename_table :projects, :presentations
    rename_table :project_technologies, :presentation_technologies
    rename_column :presentation_technologies, :project_id, :presentation_id
  end

  def down
    rename_table :presentations, :projects
    rename_table :presentation_technologies, :project_technologies
    rename_column :project_technologies, :presentation_id, :project_id
  end
end
