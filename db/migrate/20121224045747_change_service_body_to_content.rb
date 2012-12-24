class ChangeServiceBodyToContent < ActiveRecord::Migration
  def change
    rename_column :services, :body, :content
  end
end
