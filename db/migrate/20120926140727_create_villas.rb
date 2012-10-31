class CreateVillas < ActiveRecord::Migration
  def change
    create_table :villas do |t|
      t.string :name
      t.text :content
      t.float :latitude
      t.float :longitude
      t.boolean  :gmaps
      t.string   :address
      t.text   :observations
      t.integer :sleeps, :default => 4
      t.integer :bedrooms, :default => 2

      t.timestamps
    end
  end
end
