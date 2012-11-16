class AddSlugToCostaTropicals < ActiveRecord::Migration
  def change
    add_column :costa_tropicals, :slug, :string
    add_index :costa_tropicals, :slug
  end
end
