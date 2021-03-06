class CreateTagTranslations < ActiveRecord::Migration
  def up
    Tag.create_translation_table!({
        name: :string,
    }, {
        migrate_data: true
    })
  end

  def down
    Tag.drop_translation_table! migrate_data: true
  end
end
