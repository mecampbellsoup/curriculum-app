class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :name
      t.integer :number
      t.integer :position

      t.timestamps
    end
  end
end
