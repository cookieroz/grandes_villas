class ChangeDataTypeForRates < ActiveRecord::Migration
  def up
    change_table :rates do |t|
      t.change :price, :string
    end
  end

  def down
    change_table :rates do |t|
      t.change :price, :integer
    end
  end
end
