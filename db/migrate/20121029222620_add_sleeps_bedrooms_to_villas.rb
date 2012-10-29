class AddSleepsBedroomsToVillas < ActiveRecord::Migration
  def change
    add_column :villas, :sleeps, :integer, :default => 4
    add_column :villas, :bedrooms, :integer, :default => 2
  end
end
