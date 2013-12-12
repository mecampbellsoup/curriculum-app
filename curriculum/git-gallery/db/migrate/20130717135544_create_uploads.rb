class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :name
      t.string :extension
      t.belongs_to :uploadable, polymorphic: true

      t.timestamps
    end
    add_index :uploads, [:uploadable_id, :uploadable_type]
  end
end
