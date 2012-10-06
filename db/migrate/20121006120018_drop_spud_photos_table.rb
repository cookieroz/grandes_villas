class DropSpudPhotosTable < ActiveRecord::Migration
  def up
    drop_table :spud_photos
  end

  def down
  end
end
