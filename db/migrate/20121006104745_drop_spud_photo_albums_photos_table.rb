class DropSpudPhotoAlbumsPhotosTable < ActiveRecord::Migration
  def up
    drop_table :spud_photo_albums_photos
  end

  def down
  end
end
