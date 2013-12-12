class AddUsernameToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :username, :string
  end
end
