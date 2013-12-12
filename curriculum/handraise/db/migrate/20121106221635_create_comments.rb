class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.boolean :is_answer

      t.timestamps
    end
  end
end
