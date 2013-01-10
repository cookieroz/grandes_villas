class AddLinkToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :photo_link, :string
  end
end
