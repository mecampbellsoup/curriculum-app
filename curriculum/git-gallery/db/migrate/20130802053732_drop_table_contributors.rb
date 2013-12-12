class DropTableContributors < ActiveRecord::Migration
  def up
    drop_table :contributors
  end

  def down
    create_table :contributors do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
