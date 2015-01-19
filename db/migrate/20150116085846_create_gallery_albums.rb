class CreateGalleryAlbums < ActiveRecord::Migration
  def up
    create_table :gallery_albums do |t|
      t.string :name
      t.timestamps null: false
    end

    GalleryAlbum.create_translation_table!(name: :string)
  end

  def down
    drop_table :gallery_albums

    GalleryAlbum.drop_translation_table!
  end
end
