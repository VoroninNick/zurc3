class Article < ActiveRecord::Base
  has_one :image, as: :assetable, class_name: 'Assets::Image'
  accepts_nested_attributes_for :image
  attr_accessible :image, :image_attributes

  attr_accessible :name, :short_description, :intro, :content, :article_category, :article_category_id, :release_date, :author
  t.belongs_to :article_category

  translates :name, :short_description, :content, :author, :intro, :versioning => :paper_trail
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes

  class Translation
    attr_accessible :locale, :name, :short_description, :content, :author, :intro
  end
end
