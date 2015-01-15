class CreateMenuItems < ActiveRecord::Migration
  def up
    #menu_item_model = Vs::MenuItem
    menu_items_table_name = :menu_items

    create_table menu_items_table_name do |t|
      t.string :url
      t.string :title
      t.integer :linkable_id
      t.string :linkable_type
      t.string :ancestry
      t.string :link_source, default: "url", null: false
      t.string :title_source, default: "title", null: false
      t.integer :position
      t.timestamps null: false
    end

    menu_item_model = Vs::MenuItem

    menu_item_model.create_translation_table!(title: :string, url: :string)

    add_index menu_items_table_name, :ancestry
  end

  def down
    menu_item_model = Vs::MenuItem

    remove_index menu_item_model.table_name, :ancestry

    drop_table menu_item_model.table_name

    menu_item_model.drop_translation_table!
  end
end
