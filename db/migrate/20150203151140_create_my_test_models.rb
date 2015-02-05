class CreateMyTestModels < ActiveRecord::Migration
  def change
    create_table :my_test_models do |t|
      t.belongs_to :article
      t.timestamps null: false
    end
  end
end
