class AddImageToVillas < ActiveRecord::Migration
  def change
    add_column :villas, :image, :string
  end
end
