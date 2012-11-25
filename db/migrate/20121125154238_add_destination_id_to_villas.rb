class AddDestinationIdToVillas < ActiveRecord::Migration
  def change
    add_column :villas, :destination_id, :integer
  end
end
