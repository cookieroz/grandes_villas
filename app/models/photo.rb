class Photo < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  attr_accessible :caption, :villa_id, :image, :remote_image_url, :remove_image
  mount_uploader :image, ImageUploader

  belongs_to :villa

  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
        "id" => id,
        "name" => read_attribute(:image),
        "size" => image.size,
        "url" => image.url,
        "thumbnail_url" => image.thumb.url,
        "delete_url" => photo_path(:id => id),
        "delete_type" => "DELETE"
    }
  end
end
