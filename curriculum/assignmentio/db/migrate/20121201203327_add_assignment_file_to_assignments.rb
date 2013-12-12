class AddAssignmentFileToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :assignment_file, :string
  end
end
