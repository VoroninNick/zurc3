class CreateArticleCategories < ActiveRecord::Migration
  def change
    create_table :article_categories do |t|
      t.string :name
      t.string :ancestry
      t.integer :position

      t.timestamps null: false
    end

    ArticleCategory.create_translation_table!(name: :string)
  end
end
