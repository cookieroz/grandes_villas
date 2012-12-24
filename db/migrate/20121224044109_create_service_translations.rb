class CreateServiceTranslations < ActiveRecord::Migration
  def up
    Service.create_translation_table!({
      title: :string,
      body: :text
    }, {
      migrate_data: true
    })
  end

  def down
    Service.drop_translation_table! migrate_data: true
  end
end
