class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :birth_year
      t.timestamps
    end
  end
end
