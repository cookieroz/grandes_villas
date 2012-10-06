class DropSpudPhotoAlbumsTable < ActiveRecord::Migration
  def up
    drop_table :spud_photo_albums
  end

  def down
  end
end
