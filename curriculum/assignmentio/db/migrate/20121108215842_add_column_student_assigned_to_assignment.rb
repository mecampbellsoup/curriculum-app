class AddColumnStudentAssignedToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :student_assigned, :string
  end
end
