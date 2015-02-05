class CreateHomeSlides < ActiveRecord::Migration
  def up
    create_table :partials_home_slides do |t|
      t.boolean :published
      t.integer :position
      t.string :image
      t.string :title
      t.text :description

      t.string :page_type
      t.integer :page_id

      t.timestamps null: false
    end

    Partials::HomeSlide.create_translation_table!(title: :string, description: :text)
  end

  def down
    drop_table :home_slides
    Partials::HomeSlide.drop_translation_table!
  end
end
