class Destination < ActiveRecord::Base
  attr_accessible :name, :content, :content, :address,
                  :latitude, :longitude, :dest_image

  mount_uploader :dest_image

  has_many :villas

  translates :content

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  acts_as_gmappable :latitude => 'latitude', :longitude => 'longitude',
                    :process_geocoding => :geocode?,
                    :address => "address", :normalized_address => "address",
                    :msg => "Sorry, not even Google could figure out where that is"

  accepts_nested_attributes_for :villas

  def geocode?
    (!address.blank? && (latitude.blank? || longitude.blank?)) || address_changed?
  end

  class Translation
    attr_accessible :locale
  end

end
