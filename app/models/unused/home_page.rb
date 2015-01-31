module Unused
  class Pages::HomePage < Page
    #has_one :slider, class_name: PageBlocks::HomeSlider
    has_many :page_and_block_joins, as: :page

    has_many :slider, through: :page_and_block_joins, source: :page_block, source_type: PageBlocks::HomeSlider
    accepts_nested_attributes_for :slider, allow_destroy: true
    attr_accessible :slides, :slider_attributes
  end
end

