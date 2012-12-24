class ChangeServiceBodyToContentTranslation < ActiveRecord::Migration
  def change
    rename_column :service_translations, :body, :content
  end
end
