class RemoveFotoFileSizeFromVillas < ActiveRecord::Migration
  def up
    remove_column :villas, :foto_file_size
  end

  def down
    add_column :villas, :foto_file_size, :integer
  end
end
