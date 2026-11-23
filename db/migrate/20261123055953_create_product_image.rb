class CreateProductImage < ActiveRecord::Migration[8.1]
  def change
    create_table :product_images do |t|
      t.references :product, foreign_key: true, null: false
      t.string :image_url

      t.timestamps
    end
  end
end
