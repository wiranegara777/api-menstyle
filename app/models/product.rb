class Product < ApplicationRecord
    has_many :images, class_name: "Product::Image"

    has_one :category, class_name: "Product::Category"
    has_one :colour, class_name: "Product::Colour"
    has_one :brand, class_name: "Product::Brand"

    after_create :generate_sku

    private

    def self.generate_sku
        update(sku: "P-#{product_category_id}-#{id}")
    end
end