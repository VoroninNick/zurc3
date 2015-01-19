class Article < ActiveRecord::Base
  has_one :image, as: :assetable, class_name: 'Assets::Image'
  accepts_nested_attributes_for :image
  attr_accessible :image, :image_attributes

  has_many :attachments, as: :assetable, class_name: 'Assets::Attachment'
  accepts_nested_attributes_for :attachments, allow_destroy: true
  attr_accessible :attachments, :attachments_attributes, :attachment_ids

  attr_accessible :name, :short_description, :intro, :content, :article_category, :article_category_id, :release_date, :slug, :author
  belongs_to :article_category

  translates :name, :short_description, :content, :author, :intro, :slug, :versioning => :paper_trail
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes

  scope :publications, proc { where(article_category_id: 4 ) }
  scope :publications_exclude_ads, proc { ads = PublicationAd.ads ; publications.select {|p| used = false; ads.map {|ad| used = true if ad.publication_id == p.id   }; !used  } }
  scope :about_us, proc { where(article_category_id: 2) }
  scope :what_we_do, proc { where(article_category_id: 1) }
  scope :news, proc { where(article_category_id: 3) }

  class Translation
    attr_accessible :locale, :name, :short_description, :content, :author, :intro, :slug
    before_validation :generate_slug

    def generate_slug
      self.slug = self.name if self.slug.blank?
      self.slug = self.slug.parameterize
    end

  end

  has_one :page_metadata, :class_name => 'Vs::PageMetadata', as: :page
  accepts_nested_attributes_for :page_metadata, allow_destroy: true
  attr_accessible :page_metadata, :page_metadata_attributes

  #def url(locale = I18n.locale)
  #end

  # delegate
  #delegate :url, to: :page_metadata

  #def find_by_url(url)
  #  joins(:page_metadata).where( page_metadata: { url: url } )
  #end

  # scope :by_url, lambda { |url|
  #   joins(:page_metadata).where( page_metadata: { url: url } )
  #              }

  #scope :by_url, ->(url) { metadata_table_name = Vs::PageMetadata.table_name; joins(metadata_table_name).where( :"#{metadata_table_name}" => { url: url } ) }
  scope :by_url, ->(url) { where(slug: url) }


  def url(locale = I18n.locale)
    if ( p = page_metadata ) && ( url = page_metadata.get_url(locale) )
      return Rails.application.routes.url_helpers.send("#{locale}_publication_view_path", locale: locale, id: url)
    else
      return "#"
    end
  end
end
