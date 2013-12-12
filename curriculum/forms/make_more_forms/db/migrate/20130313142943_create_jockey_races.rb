class CreateJockeyRaces < ActiveRecord::Migration
  def change
    create_table :jockey_races do |t|
      t.integer :jockey_id
      t.integer :race_id

      t.timestamps
    end
  end
end
