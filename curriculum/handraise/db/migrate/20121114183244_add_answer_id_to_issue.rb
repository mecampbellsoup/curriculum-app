class AddAnswerIdToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :answer_id, :integer
  end
end
