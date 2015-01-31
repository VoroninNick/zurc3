class CreateArticleAds < ActiveRecord::Migration
  def up
    create_table :article_ads do |t|
      t.belongs_to :article
      t.string :custom_release_date
      t.string :custom_title
      t.string :release_date_source
      t.string :title_source
      t.string :image_source
      t.boolean :published
      t.integer :position

      t.timestamps null: false
    end

    ArticleAd.create_translation_table!(custom_title: :string)
  end

  def down
    drop_table :article_ads

    ArticleAd.drop_translation_table!
  end

end
