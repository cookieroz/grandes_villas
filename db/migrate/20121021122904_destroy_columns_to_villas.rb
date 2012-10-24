class DestroyColumnsToVillas < ActiveRecord::Migration
  def change
    remove_column :villas, :bedrooms
    remove_column :villas, :sleeps
    remove_column :villas, :location
  end
end
