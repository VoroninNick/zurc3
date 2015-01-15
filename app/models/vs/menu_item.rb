module Vs
  class MenuItem < ActiveRecord::Base
    self.table_name = :menu_items



    attr_accessible :link_source, :url, :title, :linkable_id, :linkable_type, :ancestry, :link_source, :title_source, :position

    has_ancestry

    belongs_to :linkable, polymorphic: true

    translates :title, :url, versioning: :paper_trail
    accepts_nested_attributes_for :translations
    attr_accessible :translations, :translations_attributes

    default_value_for :link_source, "url"

    default_value_for :title_source, "title"
    
    class Translation
      attr_accessible :locale, :title, :url
    end
  end
end