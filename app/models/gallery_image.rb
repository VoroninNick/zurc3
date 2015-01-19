class GalleryImage < ActiveRecord::Base
  belongs_to :gallery_album

  attr_accessible :gallery_album, :gallery_album_id, :file

  mount_uploader :file, ImageUploader
end
