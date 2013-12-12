class RemoveAnswerIdFromIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :answer_id
  end
end
