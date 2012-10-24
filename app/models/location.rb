class Location < ActiveRecord::Base
  attr_accessible :place

  has_many :villas, through: :categorizations
end
