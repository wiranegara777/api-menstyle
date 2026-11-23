class CreateProductBrand < ActiveRecord::Migration[8.1]
  def change
    create_table :product_brands do |t|
      t.string name, index: { unique: true }

      t.timestamps
    end
  end
end
