class DropAlbumsTable < ActiveRecord::Migration
  def up
    drop_table :albums
  end

  def down
  end
end
