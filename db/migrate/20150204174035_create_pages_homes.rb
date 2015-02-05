class CreatePagesHomes < ActiveRecord::Migration
  def change
    create_table :pages_homes do |t|

      t.timestamps null: false
    end
  end
end
