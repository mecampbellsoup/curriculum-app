class CreateTableOrganization < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.text :name
      t.text :subdomain
      t.timestamps
    end
  end

end
