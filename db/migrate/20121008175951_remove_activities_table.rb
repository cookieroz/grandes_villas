class RemoveActivitiesTable < ActiveRecord::Migration
  def up
    drop_table :activities
  end

  def down
  end
end
