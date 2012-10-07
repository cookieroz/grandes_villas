class Villa < ActiveRecord::Base
  attr_accessible :content, :name, :tags_attributes, :photos_attributes

  validates :name,  :presence => true

  has_many :comments, :dependent => :destroy
  has_many :tags
  has_many :photos, :dependent => :destroy

  accepts_nested_attributes_for :tags, :allow_destroy => :true,
          :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  accepts_nested_attributes_for :photos, :allow_destroy => true

  has_many :categorizations
  has_many :categories, through: :categorizations
  accepts_nested_attributes_for :categories, allow_destroy: :true

  #has_attached_file :pic, :styles =>
  #                { :medium => "300x300>", :thumb => "100x100>" },
  #                :processors => lambda { |instance| instance.processors }
  #attr_accessor :watermark
end
