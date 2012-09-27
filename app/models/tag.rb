class Tag < ActiveRecord::Base
  belongs_to :villa
  attr_accessible :name
end
