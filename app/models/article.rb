class Article < ActiveRecord::Base
  has_one :image, as: :assetable, class_name: 'Assets::Image', autosave: true
  accepts_nested_attributes_for :image
  attr_accessible :image, :image_attributes

  has_many :attachments, as: :assetable, class_name: 'Assets::Attachment', autosave: true
  accepts_nested_attributes_for :attachments, allow_destroy: true
  attr_accessible :attachments, :attachments_attributes, :attachment_ids

  attr_accessible :name, :short_description, :intro, :content, :article_category, :article_category_id, :release_date, :slug, :author, :published
  belongs_to :article_category

  scope :publications, proc { where(article_category_id: 4 ) }
  #scope :publications_exclude_ads, ->(ads = ArticleAd.ads) { publications.select {|p| used = false; ads.map {|ad| used = true if ad.article_id == p.id   }; !used  } }
  scope :publications_exclude_ads, ->(ads = ArticleAd.ads || [] ) { ads = [] if ads.nil?; publications.where.not(id: ads.map(&:article_id) )  }
  scope :about_us, proc { where(article_category_id: 2) }
  scope :what_we_do, proc { where(article_category_id: 1) }
  scope :news, proc { where(article_category_id: 3) }
  scope :published, proc { where(published: 't') }
  scope :unpublished, proc { where.not(published: 't') }
  scope :order_by_date_desc, -> { order('release_date desc') }

  translates :name, :short_description, :content, :author, :intro, :slug, :versioning => :paper_trail, autosave: true, foreign_key: :article_id
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes



  #has_many :translations,autosave: true
  # has_many :translations, :class_name  => translation_class.name,
  #          :foreign_key => options[:foreign_key],
  #          :dependent   => :destroy,
  #          :extend      => HasManyExtensions,
  #          :autosave    => true

  class Translation
    attr_accessible :article_id, :article
    attr_accessible :locale, :name, :short_description, :content, :author, :intro, :slug
    before_validation :generate_slug

    def generate_slug
      self.slug = self.name || "" if self.slug.blank?
      self.slug = self.slug.parameterize
    end

  end

  # has_many :translations, :class_name  => ::Article::Translation.name,
  #          :foreign_key => :article_id,
  #          :dependent   => :destroy,
  #          :extend      => ::Globalize::ActiveRecord::HasManyExtensions,
  #          :autosave    => true



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
    # if ( p = page_metadata ) && ( url = page_metadata.get_url(locale) )
    #   return Rails.application.routes.url_helpers.send("#{locale}_publication_view_path", locale: locale, id: url)
    # else
    #   return "#"
    # end

    case self.article_category_id
      when 4
        return Rails.application.routes.url_helpers.send("#{locale}_publication_view_path", locale: locale, id: self.slug)
    end


    "#"
  end

  def related_publications
    Article.published.publications.where.not(id: self.id).order_by_date_desc.limit(4)
  end

  #amoeba do
    #enable
    #include_field :translations
    #clone [:translations, :attachments, :image]
    # customize([
    #   lambda { |original_item,new_item|
    #     new_item.release_date = DateTime.now
    #     new_item.name = "publication-#{new_item.id}"
    #   }
    # ])
  #end

  def self.next_model_id
    ActiveRecord::Base.connection.execute("SELECT NEXTVAL('models_id_seq')").first["nextval"].to_i
  end

  def run_clone
    #original_article = Article.first

  end
end
