class RemoveAnswerfromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :is_answer
  end
end
