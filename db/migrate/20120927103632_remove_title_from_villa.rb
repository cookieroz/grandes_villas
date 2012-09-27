class RemoveTitleFromVilla < ActiveRecord::Migration
  def up
    remove_column :villas, :title
  end

  def down
    add_column :villas, :title, :string
  end
end
