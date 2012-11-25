class Tag < ActiveRecord::Base
  belongs_to :villa
  attr_accessible :name

  translates :name

  class Translation
    attr_accessible :locale
  end
end
