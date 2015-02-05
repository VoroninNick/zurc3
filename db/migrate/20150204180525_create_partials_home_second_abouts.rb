class CreatePartialsHomeSecondAbouts < ActiveRecord::Migration
  def up
    create_table :partials_home_second_abouts do |t|
      t.boolean :published
      t.integer :position
      t.string :title
      t.text :description

      t.string :page_type
      t.integer :page_id

      t.timestamps null: false
    end

    Partials::HomeSecondAbout.create_translation_table!(title: :string, description: :text)
  end

  def down
    drop_table :partials_home_second_abouts

    Partials::HomeSecondAbout.drop_translation_table!
  end
end
