class DropTableUserTech < ActiveRecord::Migration
  def up
    drop_table :user_technologies
  end

  def down
  end
end
