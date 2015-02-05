class Partials::HomeGalleryImage < ActiveRecord::Base
  attr_accessible :published, :position, :alt
  attr_accessible :page_type, :page_id, :page

  belongs_to :page, class: Pages::Home

  translates :alt, versioning: :paper_trail


  # accepts nested attributes
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes

  class Translation
    attr_accessible :locale
    attr_accessible :title, :description
  end

  mount_uploader :image, SlideUploader
end
