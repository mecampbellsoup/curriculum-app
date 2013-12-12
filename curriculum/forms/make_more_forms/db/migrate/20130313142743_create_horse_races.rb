class CreateHorseRaces < ActiveRecord::Migration
  def change
    create_table :horse_races do |t|
      t.integer :horse_id
      t.integer :race_id

      t.timestamps
    end
  end
end
