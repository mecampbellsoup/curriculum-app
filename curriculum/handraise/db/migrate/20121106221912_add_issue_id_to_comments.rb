class AddIssueIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :issue_id, :integer
  end
end
