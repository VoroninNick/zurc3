class ArticleAd < ActiveRecord::Base
  belongs_to :article
  attr_accessible :custom_release_date, :custom_title, :custom_image, :release_date_source, :title_source, :image_source, :published, :position

  has_one :custom_image, class_name: "Assets::Image", as: :assetable, autosave: true
  accepts_nested_attributes_for :custom_image
  attr_accessible :custom_image, :custom_image_attributes

  translates :custom_title, :versioning => :paper_trail, autosave: true
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes

  class Translation
    attr_accessible :article_id, :article
    attr_accessible :locale, :custom_title
  end
end
