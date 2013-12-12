class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.string :email
      t.string :post_id

      t.timestamps
    end
  end
end
