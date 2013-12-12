class AddImageToFeatures < ActiveRecord::Migration
  def change
        add_column :features, :image, :string
    add_column :features, :image_id, :integer
  end
end
