class Activity < ActiveRecord::Base
  attr_accessible :activity, :activity_image, :content,
                  :remove_activity_image, :remote_activity_image

  mount_uploader :activity_image, ActivityImageUploader
end
