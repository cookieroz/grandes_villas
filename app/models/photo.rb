class Photo < ActiveRecord::Base
  attr_accessible :caption, :villa_id, :image, :remote_image_url, :remove_image

  belongs_to :villa

  mount_uploader :image, ImageUploader

end
