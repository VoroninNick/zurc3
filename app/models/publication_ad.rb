class PublicationAd < ActiveRecord::Base
	attr_accessible :publication_id, :publication

	#belongs_to :publication
	belongs_to

	mount_uploader :ad_image, PublicationAdUploader
	attr_accessible :ad_image

	accepts_nested_attributes_for :publication, allow_destroy: true
	attr_accessible :publication_attributes

	scope :ads, proc { first(3) }

	def image_url

	end

	def title
		publication.name
	end

	def release_date
		publication.release_date
	end
end
