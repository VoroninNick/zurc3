class CreatePartialsHomeFirstAbouts < ActiveRecord::Migration
  def up
    create_table :partials_home_first_abouts do |t|
      t.boolean :published
      t.integer :position
      t.string :title
      t.text :description

      t.string :page_type
      t.integer :page_id

      t.timestamps null: false
    end

    Partials::HomeFirstAbout.create_translation_table!(title: :string, description: :text)
  end

  def down
    drop_table :partials_home_first_abouts

    Partials::HomeFirstAbout.drop_translation_table!
  end
end
