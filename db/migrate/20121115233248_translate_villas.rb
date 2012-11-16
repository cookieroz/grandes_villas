class TranslateVillas < ActiveRecord::Migration
  def up
    Villa.create_translation_table!({
        :content => :text,
        :observations => :text
                                    },
    {
        :migrate_data => true
    })
  end

  def down
    Villa.drop_translation_table! :migrate_data => true
  end
end
