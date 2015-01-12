class CreatePublicationAds < ActiveRecord::Migration
  def change
    create_table :publication_ads do |t|
    	t.integer :publication_id
      t.string :ad_image
      t.timestamps
    end
  end
end
