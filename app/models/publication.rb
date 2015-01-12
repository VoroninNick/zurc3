class Publication < ActiveRecord::Base
    attr_accessible :name
    attr_accessible :release_date
    attr_accessible :author
    attr_accessible :intro
    attr_accessible :short_description
    attr_accessible :content
    attr_accessible :avatar
    attr_accessible :display_image_on_content_page

    attr_accessible :doc_file
    attr_accessible :pdf_file

    #has_attached_file :publication_image

    #attr_accessible :delete_publication_image

    has_many :attachments, as: :attachable


    validates :name, :author, :short_description, :full_description, :avatar, presence: true

    has_one :publication_ad

    translates :name, :author, :intro, :short_description, :full_description, :avatar, versioning: :paper_trail

    accepts_nested_attributes_for :translations
    attr_accessible :translations, :translations_attributes

    class Translation
      attr_accessible :locale, :name, :author, :intro, :short_description, :full_description, :avatar

      mount_uploader :avatar, AvatarUploader

      before_validation :set_author
      def set_author
          #author = user_for_paper_trail.email
      end
    end
end
