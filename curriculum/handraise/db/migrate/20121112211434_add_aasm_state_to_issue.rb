class AddAasmStateToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :aasm_state, :string
  end
end
