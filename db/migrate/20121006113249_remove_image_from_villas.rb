class RemoveImageFromVillas < ActiveRecord::Migration
  def up
    remove_column :villas, :image
  end

  def down
    add_column :villas, :image, :string
  end
end
