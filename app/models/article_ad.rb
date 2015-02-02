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

  scope :valid, -> { select{|a| a.valid?  } }
  scope :ads, -> { valid.first(3) }



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
