class RemoveObservationsFromRate < ActiveRecord::Migration
  def change
    remove_column :rates, :observations
  end
end
