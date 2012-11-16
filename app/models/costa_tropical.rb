class CostaTropical < ActiveRecord::Base
  attr_accessible :title, :content, :category, :ct_image,
                  :activity, :city

  mount_uploader :ct_image, CtImageUploader

  translates :content, :activity, :city, :title

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]


  #globalize_accessors :locales => [:en, :es, :fr],
  #                    :attributes => [:title, :content, :activity, :city]

  class Translation
    attr_accessible :locale
  end
end
