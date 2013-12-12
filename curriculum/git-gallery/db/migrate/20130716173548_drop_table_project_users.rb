class DropTableProjectUsers < ActiveRecord::Migration
  def up
    drop_table :project_users
  end

  def down
    create_table :project_users do |t|
      t.integer :project_id
      t.integer :user_id
      
      t.timestamps
    end
  end
end
