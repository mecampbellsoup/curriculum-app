class AddUserAssignmentIdToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :user_assignment_id, :integer
  end
end
