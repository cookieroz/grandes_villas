class CostaTropical < ActiveRecord::Base
  attr_accessible :title, :content, :category, :ct_image,
                  :activity, :city

  mount_uploader :ct_image, CtImageUploader
end
