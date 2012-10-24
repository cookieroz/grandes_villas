class CreateVillalocations < ActiveRecord::Migration
  def change
    create_table :villalocations do |t|
      t.integer :location_id
      t.integer :villa_id

      t.timestamps
    end
  end
end
