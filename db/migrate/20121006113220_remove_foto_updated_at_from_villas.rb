class RemoveFotoUpdatedAtFromVillas < ActiveRecord::Migration
  def up
    remove_column :villas, :foto_updated_at
  end

  def down
    add_column :villas, :foto_updated_at, :datetime
  end
end
