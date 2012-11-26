class CreateDestinationTranslations < ActiveRecord::Migration
  def up
    Destination.create_translation_table!({
         content: :text
    }, {
         migrate_data: true
    })
  end

  def down
    Destination.drop_translation_table! migrate_data: true
  end
end
