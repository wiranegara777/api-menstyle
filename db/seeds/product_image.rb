images_constant ={ 
    "Polo-Shirts" => [
        "https://www.masarishop.com/media/catalog/product/g/a/gapc262040_1.jpg",
        "https://www.masarishop.com/media/catalog/product/g/a/gapc262040_1b.jpg"
    ],
    "T-Shirts" => [
        "https://www.masarishop.com/media/catalog/product/m/s/msnk261016_1.jpg",
        "https://www.masarishop.com/media/catalog/product/m/s/msnk261016_1b.jpg"
    ],
    "Hoodies" => [
        "https://m.media-amazon.com/images/I/711--Ig+g7L._AC_SY550_.jpg",
        "https://m.media-amazon.com/images/I/71ysxftuFvL._AC_SY550_.jpg",
        "https://m.media-amazon.com/images/I/71oFCL0vt4L._AC_SY550_.jpg"
    ],
    "Jackets" => [
        "https://m.media-amazon.com/images/I/61AxCnOGMdL._AC_SX569_.jpg",
        "https://m.media-amazon.com/images/I/61c2oathsmL._AC_SX569_.jpg"
    ],
    "Sweaters" => [
        "https://m.media-amazon.com/images/I/71pH05l8nFL._AC_SX569_.jpg",
        "https://m.media-amazon.com/images/I/71VJbatAkVL._AC_SX569_.jpg"
    ],
    "Flannels" => [
        "https://m.media-amazon.com/images/I/71QcoDDt6xL._AC_SX466_.jpg",
        "https://m.media-amazon.com/images/I/81a6-VziS0L._AC_SX466_.jpg"
    ],
    "Jeans" => [
        "https://m.media-amazon.com/images/I/71HVSFd9fyL._AC_SY550_.jpg",
        "https://m.media-amazon.com/images/I/717+ZthhV4L._AC_SY550_.jpg"
    ],
    "Chinos" => [
        "https://m.media-amazon.com/images/I/51V9dsvXn3L._AC_SY550_.jpg",
        "https://m.media-amazon.com/images/I/61ghdmTVkTL._AC_SY550_.jpg"
    ],
    "Shorts" => [
        "https://m.media-amazon.com/images/I/314btT1ZoJL._AC_SX425_.jpg",
        "https://m.media-amazon.com/images/I/314btT1ZoJL._AC_SX425_.jpg"
    ],
    "Trousers" => [
        "https://m.media-amazon.com/images/I/611IZ4nPyfL._AC_SX466_.jpg",
        "https://m.media-amazon.com/images/I/61ym+FpWREL._AC_SX466_.jpg"
    ],
    "Cargo-Pants" => [
        "https://m.media-amazon.com/images/I/61SkA1xsiqL._AC_SY550_.jpg",
        "https://m.media-amazon.com/images/I/61RRdMQ5VKL._AC_SY550_.jpg"
    ],
    "Sweatpants" => [
        "https://m.media-amazon.com/images/I/71Lq-uAtv3L._AC_SX569_.jpg",
        "https://m.media-amazon.com/images/I/717YRQsSrsL._AC_SX569_.jpg"
    ]
}

# find only products that doesnt have any images
products = Product.includes(:images).where(product_images: { id: nil })

puts("Seeding product images")
products.each do |product|
    category = product.category.name
    images = images_constant[category]
    ActiveRecord::Base.transaction do
        product.update!(thumbnail_url: images[0])
        images.each do |image|
            Product::Image.find_or_create_by(
                product_id: product.id,
                image_url: image
            )
        end
    end
end
