class CreateRateTranslations < ActiveRecord::Migration
  def up
    Rate.create_translation_table!({
        price_info: :string,
                                   },
    {
        migrate_data: true
    })
  end

  def down
    Rate.drop_translation_table! migrate_data: true
  end
end
