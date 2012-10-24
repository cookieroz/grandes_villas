class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.string :price_info
      t.text :observations
      t.integer :price
      t.references :villa

      t.timestamps
    end
    add_index :rates, :villa_id
  end
end
