class CreateGalleryImages < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.belongs_to :gallery_album, index: true
      t.string :file

      t.timestamps null: false
    end
    add_foreign_key :gallery_images, :gallery_albums
  end
end
