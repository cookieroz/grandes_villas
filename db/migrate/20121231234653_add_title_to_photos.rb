class AddTitleToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :sug_text, :text
  end
end
