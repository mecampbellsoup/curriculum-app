class DropImagesFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :image, :string
    remove_column :projects, :image_id, :integer
  end
end
