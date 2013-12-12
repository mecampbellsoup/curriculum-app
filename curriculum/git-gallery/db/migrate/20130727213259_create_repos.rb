class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string :name
      t.integer :github_id
      t.datetime :published_at
      t.string :url

      t.timestamps
    end
  end
end
