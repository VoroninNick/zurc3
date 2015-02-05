class CreatePartialsHomeGalleryImages < ActiveRecord::Migration
  def up
    create_table :partials_home_gallery_images do |t|
      t.integer :position
      t.boolean :published
      t.string :alt
      t.belongs_to :page
      t.timestamps null: false
    end

    Partials::HomeGalleryImage.create_translation_table!(alt: :string)

  end

  def down
    drop_table :partials_home_gallery_images

    Partials::HomeGalleryImage.drop_translation_table!
  end
end
