class RemovePasswordDigestFromUSer < ActiveRecord::Migration
  def up
    remove_column :users, :password_digest
  end

  def down
  end
end
