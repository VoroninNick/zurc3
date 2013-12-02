class PublicationAd < ActiveRecord::Base
	attr_accessible :publication_id, :publication

	has_one :publication
end
