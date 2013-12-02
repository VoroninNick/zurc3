class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :title
      t.text :meta
      t.string :route
      t.string :type

      t.has_attached_file :about_page_image
      t.text :about_page_content

      t.has_attached_file :what_we_do_page_image
      t.text :what_we_do_page_content

      t.timestamps
    end
  end
end
