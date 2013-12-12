class RemoveAcceptedAnswerFromAnswers < ActiveRecord::Migration
  def up
    remove_column :answers, :accepted_answer
  end

  def down
  end
end
