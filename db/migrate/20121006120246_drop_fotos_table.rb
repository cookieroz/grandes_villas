class DropFotosTable < ActiveRecord::Migration
  def up
    drop_table :fotos
  end

  def down
  end
end
