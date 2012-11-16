class CreateCostaTropicalTranslations < ActiveRecord::Migration
  def up
    CostaTropical.create_translation_table!({
        title: :string,
        content: :text,
        activity: :string,
        city: :string
                                             }, {
        migrate_data: true
                                             })
  end

  def down
    CostaTropical.drop_translation_table! migrate_data: true
  end
end
