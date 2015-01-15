class Assets::Image < Asset
  # You can process the uploaded images and create multiple versions
  mount_uploader :file, ImageUploader
end