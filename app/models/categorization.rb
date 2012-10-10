class Categorization < ActiveRecord::Base
   attr_accessible :villa_id, :category_id

   belongs_to :category
   belongs_to :villa
end
