class Product
    class BrandSerializer < ActiveModel::Serializer
        attributes :id, 
                   :name
    end
end
