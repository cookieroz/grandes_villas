class Location < ActiveRecord::Base
  attr_accessible :place, :villas_attributes

  has_many :villas, through: :villalocation
  accepts_nested_attributes_for :villas
end
