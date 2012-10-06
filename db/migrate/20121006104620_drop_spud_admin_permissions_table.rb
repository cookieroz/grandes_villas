class DropSpudAdminPermissionsTable < ActiveRecord::Migration
  def up
    drop_table :spud_admin_permissions
  end

  def down
  end
end
