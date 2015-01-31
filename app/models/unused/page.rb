# WARNING
# Currently is not used.
module Unused
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

        #has_many :page_and_block_joins, as: :page
        #has_many :page_blocks, through: :page_and_block_joins
    end
end



# example


# class Page
#   has_many :page_blocks
# end
#
# class PageBlock
#   has_many :pages
# end
#
# module Pages
#   class Home
#     has_one :slider
#     boolean :as
#   end
#
#   class About
#     has_one :slider
#     has_many :gallery, max_count: 3
#     text :content
#   end
# end
#
# module PageBlocks
#   class Slider
#
#   end
#
#   class Gallery
#
#   end
# end