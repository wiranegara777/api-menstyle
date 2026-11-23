brands = Product::Brand.all
categories = Product::Category.all
colours = Product::Colour.all
sizes = [ 'xs', 's', 'm', 'l', 'xl' ]

# random price range 50_000 - 500_000 divisible by 500
def random_price
    (100..1000).to_a.sample * 500
end

def generate_name(category, brand, colour)
    "#{ brand.name.humanize } #{ colour.name.humanize } #{ category.name.humanize }"
end

def random_description(product_name)
  adj = %w[Premium High-quality Durable Eco-friendly Lightweight].sample
  feat = %w[warranty 1-year warranty free shipping 30-day returns].sample
  "The #{product_name} is a #{adj.downcase} product. Includes #{feat}."
end

puts("start seeding random products")
ActiveRecord::Base.transaction do
    20.times do
        brand = brands.sample
        category = categories.sample
        colour = colours.sample
        product_name = generate_name(category, brand, colour)
        prod = Product.find_or_create_by!(
            name: product_name,
            price: random_price,
            product_brand_id: brand.id,
            product_category_id: category.id,
            product_colour_id: colour.id,
            size: sizes.sample,
            stock: rand(10..100),
            description: random_description(product_name)
        )
        puts("product #{prod.name} is created")
    end
    puts("seeding products is finished")
end
