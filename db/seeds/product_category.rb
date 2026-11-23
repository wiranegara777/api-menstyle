MEN_CATEGORIES = %w[
  T-Shirts Polo-Shirts Hoodies Jackets Sweaters Flannels
  Jeans Chinos Shorts Trousers Cargo-Pants Sweatpants
].freeze

MEN_CATEGORIES.each do |category|
    Product::Category.find_or_create_by!(name: category)
end

