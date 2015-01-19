class GalleryAlbum < ActiveRecord::Base
  attr_accessible :name

  has_many :images, as: :assetable, class_name: 'Assets::Image'
  accepts_nested_attributes_for :images, allow_destroy: true
  attr_accessible :images, :images_attributes, :image_ids

  has_many :gallery_images
  accepts_nested_attributes_for :gallery_images, allow_destroy: true
  attr_accessible :gallery_images, :gallery_images_attributes, :gallery_image_ids

  translates :name, :versioning => :paper_trail
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes

  class Translation
    attr_accessible :locale, :name
  end


end
