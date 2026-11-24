class ProductSerializer < ActiveModel::Serializer
  attributes :id,
             :sku,
             :name,
             :price,
             :size,
             :stock,
             :thumbnail_url,
             :description


  belongs_to :category, serializer: Product::CategorySerializer
  belongs_to :brand, serializer: Product::BrandSerializer
  belongs_to :colour, serializer: Product::ColourSerializer
  has_many :images, each_serializer: Product::ImageSerializer
end
