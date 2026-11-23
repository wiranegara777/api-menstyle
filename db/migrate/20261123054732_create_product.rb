class CreateProduct < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :size
      t.string :sku
      t.decimal :price, precision: 12, scale: 2, null: false
      t.text :description
      t.integer :stock, default: 0
      t.string :thumbnail_url

      t.references :product_brand, null: false, foreign_key: true
      t.references :product_category, null: false, foreign_key: true
      t.references :product_colour, null: false, foreign_key: true

      t.timestamps
    end
  end
end
