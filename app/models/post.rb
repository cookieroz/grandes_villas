class Post < ActiveRecord::Base
  attr_accessible :content, :title

  translates :content, :title

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  class Translation
    attr_accessible :locale
  end
end
