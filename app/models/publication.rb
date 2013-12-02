class Publication < ActiveRecord::Base
	attr_accessible :name
    attr_accessible :title
    attr_accessible :release_date
    attr_accessible :author
    attr_accessible :intro
    attr_accessible :short_description
    attr_accessible :content
    attr_accessible :publication_image
    attr_accessible :display_image_on_content_page

    has_attached_file :publication_image

    attr_accessible :delete_publication_image


    belongs_to :publication_ad
end
