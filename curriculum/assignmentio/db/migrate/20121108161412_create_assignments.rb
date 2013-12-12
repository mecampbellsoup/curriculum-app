class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.date :due_date

      t.timestamps
    end
  end
end
