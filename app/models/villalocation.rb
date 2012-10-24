class Villalocation < ActiveRecord::Base
  attr_accessible :location_id, :villa_id

  belongs_to :location
  belongs_to :villa
end
