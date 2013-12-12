class AddOrgCodeToOrginization < ActiveRecord::Migration
  def change
    add_column :organizations, :org_code, :string
  end
end
