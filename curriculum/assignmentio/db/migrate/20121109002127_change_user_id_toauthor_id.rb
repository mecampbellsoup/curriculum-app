class ChangeUserIdToauthorId < ActiveRecord::Migration
  def up
    rename_column :assignments, :user_id, :author_id
  end

  def down
    rename_column :assignments, :author_id, :user_id
  end
end
