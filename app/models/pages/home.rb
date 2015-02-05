class Pages::Home < ActiveRecord::Base
  # associations
  has_many :slides, class: Partials::HomeSlide, as: :page
  has_many :first_about, class: Partials::HomeFirstAbout, as: :page
  has_many :second_about, class: Partials::HomeSecondAbout, as: :page
  has_many :home_gallery_images, class: Partials::HomeGalleryImage

  # attr_accessible for associations
  attr_accessible :slides, :first_about, :second_about, :home_gallery_images

  # accepts nested attributes
  [:slides, :first_about, :second_about, :home_gallery_images].each do |attr_name|
    accepts_nested_attributes_for attr_name
    attr_accessible "#{attr_name}_attributes".to_sym
  end


end
