class DropTableProjectContributors < ActiveRecord::Migration
  def up
    drop_table :project_contributors
  end

  def down
    create_table :project_contributors do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
