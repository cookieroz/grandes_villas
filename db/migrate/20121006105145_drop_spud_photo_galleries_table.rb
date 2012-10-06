class DropSpudPhotoGalleriesTable < ActiveRecord::Migration
  def up
    drop_table :spud_photo_galleries
  end

  def down
  end
end
