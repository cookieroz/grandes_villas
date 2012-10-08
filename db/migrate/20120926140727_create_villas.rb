class CreateVillas < ActiveRecord::Migration
  def change
    create_table :villas do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
