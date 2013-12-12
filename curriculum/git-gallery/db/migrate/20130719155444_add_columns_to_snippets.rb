class AddColumnsToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :url, :string
    add_column :snippets, :description, :string
    add_column :snippets, :feature_id, :integer
  end
end
