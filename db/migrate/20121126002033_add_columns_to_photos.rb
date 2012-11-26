class AddColumnsToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :image_uid, :integer
    add_column :photos, :image_name, :string
    add_column :photos, :path, :string
    add_column :photos, :name, :string
  end
end
