class CreateModelFieldsStringModelFields < ActiveRecord::Migration
  def change
    create_table :model_fields_string_model_fields do |t|
      t.string :data
      t.integer :model_id
      t.string :model_type

      t.timestamps null: false
    end
  end
end
