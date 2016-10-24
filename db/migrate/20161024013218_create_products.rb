class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price, precision: 8, scale: 2
      t.string :description
      t.string :img_url

      t.timestamps null: false
    end
  end
end
