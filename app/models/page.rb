class Page < ActiveRecord::Base
	attr_accessible :name
    attr_accessible :title
    attr_accessible :meta
    attr_accessible :route
    attr_accessible :type
end
