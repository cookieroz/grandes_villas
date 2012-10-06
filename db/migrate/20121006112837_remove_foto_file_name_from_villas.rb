class RemoveFotoFileNameFromVillas < ActiveRecord::Migration
  def up
    remove_column :villas, :foto_file_name
  end

  def down
    add_column :villas, :foto_file_name, :string
  end
end
