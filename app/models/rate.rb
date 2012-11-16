class Rate < ActiveRecord::Base
  belongs_to :villa

  attr_accessible :price_info, :price, :villa_id

  translates :price_info

  class Translation
    attr_accessible :locale
  end

end