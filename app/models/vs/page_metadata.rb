module Vs
  class PageMetadata < ActiveRecord::Base
    self.table_name = "voronin_studio_page_metadata"
    attr_accessible :head_title, :meta_tags, :meta_description

    translates :head_title, :meta_tags, :meta_description, :versioning => :paper_trail
    attr_accessible :translations

    attr_accessible :name


    before_save :init_fields
    def init_fields
      if page
        if page.respond_to?(:translated_locales)
          page.translated_locales.each do |locale|
            page_translation = page.translations_by_locale[locale]
            if !translated_locales.include?(locale)
              t = Translation.new(locale: locale, voronin_studio_page_metadatum_id: self.id)
            else
              t = translations_by_locale[locale]
            end

            if !t.head_title || t.head_title == ''
              t.head_title = page_translation.name
            end
          end
        else
          if page.respond_to?(:name)
            self.translations.each do |t|
              if !t.head_title || t.head_title == ''
                t.head_title = page.name
              end
            end
          end

          if page.respond_to?(:short_description)
            self.translations.each do |t|
              if !t.head_title || t.head_title == ''
                t.meta_description = page.short_description
              end
            end
          end

          if page.respond_to?(:event_tags)
            self.translations.each do |t|
              if !t.meta_tags || t.meta_tags == ''
                t.meta_tags = page.event_tags.map(&:name).join(',')
              end
            end
          end
        end
      end
    end

    def get_url(locale = I18n.locale)
      #self.translations_by_locale[locale.to_sym].url
      self.page.translations_by_locale[locale.to_sym].slug
    end

    # nested
    accepts_nested_attributes_for :translations, allow_destroy: true
    attr_accessible :translations_attributes

    belongs_to :page, polymorphic: true
    attr_accessible :page

    class Translation
      attr_accessible :voronin_studio_page_metadatum_id
      self.table_name = "voronin_studio_page_metadatum_translations"
      attr_accessible :locale, :head_title, :meta_tags, :meta_description

      rails_admin do
        visible false
        field :locale, :hidden
        field :head_title do

        end
        field :meta_description do

        end
        field :meta_tags do

        end
      end
    end

    rails_admin do
      #navigation_label I18n.t("rails_admin.navigation_labels.pages")
      #label I18n.t("rails_admin.model_labels.#{self.abstract_model.model_name.underscore}")
      #label_plural I18n.t("rails_admin.model_labels_plural.#{self.abstract_model.model_name.underscore}")
      weight 4

      edit do
        field :page
        field :name
        field :translations, :globalize_tabs do

        end
      end

      nested do
        field :name do
          hide
        end
        field :page do
          hide
        end
        field :translations

      end
    end
  end
end