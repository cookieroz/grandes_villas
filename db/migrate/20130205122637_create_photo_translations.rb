class CreatePhotoTranslations < ActiveRecord::Migration
  def up
    Photo.create_translation_table!({
      caption: :string,
      sug_text: :text
    }, {
      migrate_data: true
    })
  end

  def down
    Photo.drop_translation_table! migrate_data: true
  end
end
