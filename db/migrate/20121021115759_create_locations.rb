class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :place
      t.references :villa


      t.timestamps
    end
    add_index :locations, :villa_id
  end
end
