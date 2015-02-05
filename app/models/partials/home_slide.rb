class Partials::HomeSlide < ActiveRecord::Base
  attr_accessible :published, :position, :title, :description
  attr_accessible :page_type, :page_id, :page

  belongs_to :page, polymorphic: true

  translates :title, :description, versioning: :paper_trail


  # accepts nested attributes
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes

  class Translation
    attr_accessible :locale
    attr_accessible :title, :description
  end

  mount_uploader :image, SlideUploader
end
