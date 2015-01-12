class PublicationAd < ActiveRecord::Base
	attr_accessible :publication_id, :publication

	belongs_to :publication

	attr_accessible :ad_image, PublicationAdUploader

	accepts_nested_attributes_for :publication, allow_destroy: true
	attr_accessible :publication_attributes
end
