class DropSpudUsersTable < ActiveRecord::Migration
  def up
    drop_table :spud_users
  end

  def down
  end
end
