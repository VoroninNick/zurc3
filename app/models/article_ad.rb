class ArticleAd < ActiveRecord::Base
  belongs_to :article
  attr_accessible :article, :article_id
  attr_accessible :custom_release_date, :custom_title, :custom_image, :release_date_source, :title_source, :image_source, :published, :position

  has_one :custom_image, class_name: "Assets::Image", as: :assetable, autosave: true
  accepts_nested_attributes_for :custom_image
  attr_accessible :custom_image, :custom_image_attributes

  translates :custom_title, :versioning => :paper_trail, autosave: true
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes

  validates_presence_of :article

  scope :valid, -> { except{|a| !a.valid?  } }
  #scope :valid, -> { ids_to_ignore = []; all.each{|a| ids_to_ignore << !a.valid?;  }; return where.not(id: ids_to_ignore) if ids_to_ignore.count > 0; all }
  scope :ads, -> { valid.limit(3) }


  def valid?
    super && !title.blank? && !release_date.blank? && !image_url.blank?
  end

  def title
    if self.title_source == "title"
      self.custom_title
    else
      self.article ? self.article.name : nil
    end
  end

  def release_date
    if self.release_date_source == "release_date"
      self.custom_release_date
    else
      self.article ? self.article.release_date : nil
    end
  end

  def image_url
    uploader = nil
    if self.image_source == "image"
      uploader = ( ( ( img = self.custom_image) &&  ( f = img.file) ) ? f : nil  )
    else
      uploader = ( ((a = self.article) && ( img = a.image) &&  (f = img.file) ) ? f : nil  )
    end

    if !uploader.nil? && (ads = ArticleAd.ads ) && ads.where(id: self.id).count > 0
      if ads.first.id = self.id
        uploader.send('featured_article_large').url
      else
        uploader.send('featured_article_small').url
      end
    else
      return nil
    end
  end



  def initialize(args)
    super
    if title_source.blank?
      self.title_source = "association"
    end

    if image_source.blank?
      self.image_source = "association"
    end

    if release_date_source.blank?
      self.release_date_source = "association"
    end
  end

  class Translation
  attr_accessible :article_ad_id, :article_ad
  attr_accessible :locale, :custom_title
  end
end
