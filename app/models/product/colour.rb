class Product
    class Colour < ApplicationRecord
        validates :name, uniqueness: true, presence: true
    end
end