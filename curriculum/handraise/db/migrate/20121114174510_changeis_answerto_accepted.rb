class ChangeisAnswertoAccepted < ActiveRecord::Migration
  def change
    rename_column :answers, :is_answer, :accepted_answer
  end
end
