class Page < ActiveRecord::Base
	attr_accessible :name
    attr_accessible :title
    attr_accessible :meta
    attr_accessible :route
    attr_accessible :type

    attr_accessible :about_page_image
    attr_accessible :about_page_content

    attr_accessible :what_we_do_page_image
    attr_accessible :what_we_do_page_content

    has_attached_file :about_page_image
    has_attached_file :what_we_do_page_image

    attr_accessible :delete_about_page_image

    attr_accessible :delete_what_we_do_page_image
end
