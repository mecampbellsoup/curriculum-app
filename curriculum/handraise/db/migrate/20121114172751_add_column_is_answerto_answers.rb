class AddColumnIsAnswertoAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :is_answer, :boolean
  end
end
