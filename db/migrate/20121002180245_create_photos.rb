class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :caption
      t.integer :villa_id
      t.string :image

      t.timestamps
    end
  end
end
