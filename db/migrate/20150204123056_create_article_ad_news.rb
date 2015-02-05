class CreateArticleAdNews < ActiveRecord::Migration
  def change
    create_table :article_ad_news do |t|

      t.timestamps null: false
    end
  end
end
