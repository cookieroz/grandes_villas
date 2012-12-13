class CostaTropical < ActiveRecord::Base
  attr_accessible :title, :content, :category, :ct_image_attributes,
                  :activity, :city

  has_one :ct_image, as: :imageable, class_name: "Photo"
  accepts_nested_attributes_for :ct_image

  translates :content, :activity, :city, :title

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]


  #globalize_accessors :locales => [:en, :es, :fr],
  #                    :attributes => [:title, :content, :activity, :city]

  class Translation
    attr_accessible :locale
  end
end
