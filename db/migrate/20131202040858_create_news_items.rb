class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      t.string :name
      t.string :title
      t.date :release_date
      t.string :author
      t.text :intro
      t.text :short_description
      t.text :content
      t.has_attached_file :news_image
      t.boolean :display_image_on_content_page
      
      t.timestamps
    end
  end
end
