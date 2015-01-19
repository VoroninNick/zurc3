class ArticleCategory < ActiveRecord::Base
  attr_accessible :name

  translates :name, :versioning => :paper_trail
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes

  has_ancestry

  class Translation
    attr_accessible :locale, :name
  end
end
