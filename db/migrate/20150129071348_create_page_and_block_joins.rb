class CreatePageAndBlockJoins < ActiveRecord::Migration
  def change
    create_table :page_and_block_joins do |t|
      #belongs_to :page, polymorphic: true
      #belongs_to :page_block, polymorphic: true
      t.integer :page_id
      t.string :page_type

      t.integer :page_block_id
      t.string :page_block_type

      t.timestamps null: false
    end
  end
end
