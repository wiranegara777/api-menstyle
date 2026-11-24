class Product
    class ImageSerializer < ActiveModel::Serializer
        attributes :id, 
                   :product_id,
                   :image_url
    end
end
