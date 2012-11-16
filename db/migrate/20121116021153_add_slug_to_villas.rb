class AddSlugToVillas < ActiveRecord::Migration
  def change
    add_column :villas, :slug, :string
    add_index :villas, :slug
  end
end
