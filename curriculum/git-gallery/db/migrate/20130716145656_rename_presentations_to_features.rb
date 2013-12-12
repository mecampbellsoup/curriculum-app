class RenamePresentationsToFeatures < ActiveRecord::Migration
  def up
    rename_table :presentations, :features
    rename_table :presentation_technologies, :feature_technologies
    rename_column :feature_technologies, :presentation_id, :feature_id
  end

  def down
    rename_table :features, :presentations
    rename_table :feature_technologies, :presentation_technologies
    rename_column :presentation_technologies, :feature_id, :presentation_id
  end
end
