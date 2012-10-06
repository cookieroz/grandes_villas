class DropSpudPhotoGalleriesAlbumsTable < ActiveRecord::Migration
  def up
    drop_table :spud_photo_galleries_albums
  end

  def down
  end
end
