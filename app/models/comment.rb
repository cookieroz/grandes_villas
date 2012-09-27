class Comment < ActiveRecord::Base
  belongs_to :villa
  attr_accessible :body, :commenter
end
