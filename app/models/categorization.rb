class Categorization < ActiveRecord::Base
  attr_accessible :category_id, :villa_id

  belongs_to :category
  belongs_to :villa

end
