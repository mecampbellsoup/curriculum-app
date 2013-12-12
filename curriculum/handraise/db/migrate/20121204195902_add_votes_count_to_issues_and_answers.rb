class AddVotesCountToIssuesAndAnswers < ActiveRecord::Migration
  def change
    add_column :issues, :votes_count, :integer
    add_column :answers,:votes_count, :integer
  end
end
