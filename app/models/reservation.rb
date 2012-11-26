class Reservation < ActiveRecord::Base
  attr_accessible :start_date, :end_date, :villa_id

  belongs_to :villa
end
