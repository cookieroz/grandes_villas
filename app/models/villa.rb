class Villa < ActiveRecord::Base
  attr_accessible :content, :name, :address, :latitude, :category_ids,
                  :longitude, :location_ids, :observations, :sleeps,
                  :bedrooms, :bathroom, :destination_id,
                  :tags_attributes, :photos_attributes,
                  :categories_attributes, :locations_attributes,
                  :rates_attributes, :reservations_attributes

  translates :content, :observations

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  validates :name,  :presence => true

  has_many :comments, :dependent => :destroy
  has_many :tags
  has_many :photos, :dependent => :destroy
  has_many :categorizations
  has_many :categories, through: :categorizations, :dependent => :destroy
  has_many :villalocations
  has_many :locations, through: :villalocations, :dependent => :destroy
  has_many :rates
  has_many :reservations, :dependent => :destroy

  belongs_to :destination

  accepts_nested_attributes_for :tags, allow_destroy: true,
          :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  accepts_nested_attributes_for :locations, allow_destroy: true
  accepts_nested_attributes_for :rates, allow_destroy: true
  accepts_nested_attributes_for :photos, allow_destroy: true
  accepts_nested_attributes_for :categories,  allow_destroy: true
  accepts_nested_attributes_for :reservations, allow_destroy: true

  acts_as_gmappable

  def gmaps4rails_address
    "#{self.latitude}, #{self.longitude}"
  end

  #scope :town, lambda {
  #  joins(:locations).
  #  where("locations.place <= ?", :place).
  #  group("villas.id")
  #}

  def self.by_locations(location)
    joins(:locations).where('location_id = ?', location.to_i)
  end

  def self.by_sleeps(sleeps)
    where('sleeps = ?', sleeps.to_i)
  end

  #has_attached_file :pic, :styles =>
  #                { :medium => "300x300>", :thumb => "100x100>" },
  #                :processors => lambda { |instance| instance.processors }
  #attr_accessor :watermark
  class Translation
    attr_accessible :locale
  end
end
