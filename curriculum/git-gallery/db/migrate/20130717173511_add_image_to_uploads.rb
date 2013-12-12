class AddImageToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :image, :string
    add_column :uploads, :image_id, :integer
  end
end
