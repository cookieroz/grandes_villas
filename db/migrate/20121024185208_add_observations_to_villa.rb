class AddObservationsToVilla < ActiveRecord::Migration
  def change
    add_column :villas, :observations, :text
  end
end
