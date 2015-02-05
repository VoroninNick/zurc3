class Partials::HomeFirstAbout < ActiveRecord::Base
  attr_accessible :published, :position, :title, :description
  attr_accessible :page_type, :page_id, :page

  belongs_to :page, polymorphic: true

  translates :title, :description, versioning: :paper_trail

  # def initialize attributes = nil, options = {}
  #   super(attributes, *options)
  #   if translations.count == 0
  #     I18n.available_locales.each do |locale|
  #       self.translations.build(locale: locale)
  #     end
  #   end
  # end

  # accepts nested attributes
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes

  class Translation
    attr_accessible :partials_home_first_about_id
    attr_accessible :locale
    attr_accessible :title, :description
  end
end
