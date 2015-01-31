class PageBlocks::HomeSlider < PageBlock
  # start must be inherited from PageBlock
  has_many :page_and_block_joins, as: :page_block

  has_many :pages, through: :page_and_block_joins, source: :page, source_type: Pages::HomePage
  # end

  #has_one :url_field, class_name: ModelFields::StringModelField
  #has_no_table
  #column :url_field, :text


end