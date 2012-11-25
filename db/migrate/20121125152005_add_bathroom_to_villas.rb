class AddBathroomToVillas < ActiveRecord::Migration
  def change
    add_column :villas, :bathroom, :float
  end
end
