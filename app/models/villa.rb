class Villa < ActiveRecord::Base
  attr_accessible :content, :name

  validates :name,  :presence => true

  has_many :comments, :dependent => :destroy
  has_many :tags

  accepts_nested_attributes_for :tags, :allow_destroy => :true,
          :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

end
