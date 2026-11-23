class Product < ApplicationRecord
    has_many :images, class_name: "Product::Image"

    belongs_to :category, class_name: "Product::Category", foreign_key: "product_category_id"
    belongs_to :colour, class_name: "Product::Colour", foreign_key: "product_colour_id"
    belongs_to :brand, class_name: "Product::Brand", foreign_key: "product_brand_id"

    enum :size, {
        xs: "xs",
        s:  "s",
        m:  "m",
        l:  "l",
        xl: "xl"
    }, validate: true

    after_create :generate_sku

    private

    def generate_sku
        update(sku: "P-#{product_category_id}-#{id}")
    end
end
