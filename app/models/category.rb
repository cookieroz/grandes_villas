class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :villas, through: :categorizations

  translates :name

  class Translation
    attr_accessible :locale
  end
end
