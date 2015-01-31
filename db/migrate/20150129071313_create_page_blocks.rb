class CreatePageBlocks < ActiveRecord::Migration
  def change
    create_table :page_blocks do |t|
      t.string :type
      t.timestamps null: false
    end
  end
end
