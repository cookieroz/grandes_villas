class Rate < ActiveRecord::Base
  belongs_to :villa

  attr_accessible :price_info, :observations, :price, :villa_id

end