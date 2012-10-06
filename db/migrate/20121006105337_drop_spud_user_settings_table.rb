class DropSpudUserSettingsTable < ActiveRecord::Migration
  def up
    drop_table :spud_user_settings
  end

  def down
  end
end
