class CreateProjectContributors < ActiveRecord::Migration
  def change
    create_table :project_contributors do |t|
      t.integer :project_id
      t.integer :contributor_id

      t.timestamps
    end
  end
end
