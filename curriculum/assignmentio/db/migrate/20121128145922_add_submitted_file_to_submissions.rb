class AddSubmittedFileToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :submitted_file, :string
  end
end



