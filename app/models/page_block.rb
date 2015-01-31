module Unused
  class PageBlock < ActiveRecord::Base
    #has_many :page_and_block_joins, as: :page_block
    #has_many :pages, through: :page_and_block_joins
  end
end