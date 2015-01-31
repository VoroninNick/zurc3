class CreateArticles < ActiveRecord::Migration
  def up
    create_table :articles do |t|
      t.boolean :published
      t.string :name
      t.text :short_description
      t.text :intro
      t.text :content
      t.belongs_to :article_category
      t.datetime :release_date

      t.string :author

      t.string :slug


      t.timestamps null: false
    end

    Article.create_translation_table!(name: :string, short_description: :text, content: :text, author: :string, intro: :text, slug: :string)
  end

  def down
    drop_table :articles

    Article.drop_translation_table!
  end
end
