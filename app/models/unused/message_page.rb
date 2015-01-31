module Unused
  class Pages::MessagePage < Page
    attr_accessor :color, :rating, :properties
    #serialize :properties


    before_save do
      #puts serialize([color, rating])
      json = properties.to_json
      puts json
    end
  end
end
