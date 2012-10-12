class Villa < ActiveRecord::Base
  attr_accessible :content, :name, :address, :latitude,
                  :longitude,:tags_attributes, :category_ids,
                  :photos_attributes, :categories_attributes

  validates :name,  :presence => true

  has_many :comments, :dependent => :destroy
  has_many :tags
  has_many :photos, :dependent => :destroy
  has_many :categorizations
  has_many :categories, through: :categorizations

  accepts_nested_attributes_for :tags, :allow_destroy => :true,
          :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  accepts_nested_attributes_for :photos, :allow_destroy => true

  accepts_nested_attributes_for :categories,  :allow_destroy => true

  acts_as_gmappable :latitude => 'latitude', :longitude => 'longitude',
                    :process_geocoding => :geocode?,
                    :address => "address", :normalized_address => "address",
                    :msg => "Sorry, not even Google could figure out where that is"

  def geocode?
    (!address.blank? && (latitude.blank? || longitude.blank?)) || address_changed?
  end

  #has_attached_file :pic, :styles =>
  #                { :medium => "300x300>", :thumb => "100x100>" },
  #                :processors => lambda { |instance| instance.processors }
  #attr_accessor :watermark
end
