class Product
    class Category < ApplicationRecord
        validates :name, uniqueness: true, presence: true
    end
end