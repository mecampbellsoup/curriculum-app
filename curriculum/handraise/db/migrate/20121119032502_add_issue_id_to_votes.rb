class AddIssueIdToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :issue_id, :integer
  end
end
