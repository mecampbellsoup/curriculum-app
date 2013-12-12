class AddSubmissionIdToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :submission_id, :integer
  end
end
