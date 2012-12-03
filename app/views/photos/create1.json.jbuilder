json.array!([@photo]) do |json, photo|
  json.name photo.photo_file
  json.size photo.photo_file.size
  json.current_path photo.photo_file.current_path
  json.url photo.photo_file.url
  json.thumbnail_url photo.photo_file.url(:thumb)
end