class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets, :force => true do |t|
      t.string   :type
      t.text     :file
      t.integer  :assetable_id
      t.string   :assetable_type
      t.integer :priority
      t.timestamps
    end

    add_index :assets, [:assetable_id, :assetable_type]
    add_index :assets, :type
  end
end
