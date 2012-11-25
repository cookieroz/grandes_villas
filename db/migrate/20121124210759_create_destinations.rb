class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :name
      t.text :content
      t.float :latitude
      t.float :longitude
      t.boolean  :gmaps
      t.string   :address
      t.string :dest_image

      t.timestamps
    end
  end
end
