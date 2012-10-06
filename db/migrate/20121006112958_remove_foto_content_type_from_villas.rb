class RemoveFotoContentTypeFromVillas < ActiveRecord::Migration
  def up
    remove_column :villas, :foto_content_type
  end

  def down
    add_column :villas, :foto_content_type, :string
  end
end
