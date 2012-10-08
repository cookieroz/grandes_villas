class RemoveAllCategoryTables < ActiveRecord::Migration
  def up
    drop_table :categorizations
    drop_table :categories
  end

  def down
  end
end
