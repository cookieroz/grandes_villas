class CreateCostaTropicals < ActiveRecord::Migration
  def change
    create_table :costa_tropicals do |t|
      t.string :title
      t.string :category
      t.string :ct_image
      t.string :city
      t.string :activity
      t.text :content

      t.timestamps
    end
  end
end
