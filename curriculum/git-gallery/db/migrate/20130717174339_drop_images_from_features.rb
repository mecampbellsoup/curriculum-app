class DropImagesFromFeatures < ActiveRecord::Migration
  def change
    remove_column :features, :image, :string
    remove_column :features, :image_id, :integer
  end
end
