class CreatePublications < ActiveRecord::Migration
  def up
    publication_model = Publication

    create_table publication_model.table_name do |t|
      t.string :name
      t.date :release_date
      t.string :author
      t.text :intro
      t.text :short_description
      t.text :full_description
      #t.has_attached_file :publication_image
      t.string :avatar
      t.boolean :display_image_on_content_page

      t.timestamps
    end

    publication_model.create_translation_table!(name: :string, author: :string, intro: :text, short_description: :text, full_description: :text, avatar: :string)

    #change_table publication_model.translation_class.table_name do |t|
    #end
  end

  def down
    publication_model = Publication

    drop_table publication_model.table_name

    publication_model.drop_translation_table!
  end
end
