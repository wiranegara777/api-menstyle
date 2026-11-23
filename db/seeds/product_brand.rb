brands = [
  "erigo",
  "eiger",
  "aerostreet",
  "uniqlo",
  "adidas",
  "nike",
  "zara",
  "h&m",
  "skechers",
  "buttonscarves",
  "danjyo hiyoji",
  "sejauh mata memandang",
  "elhaus",
  "cotton ink",
  "the executive",
  "matahari",
  "klamby",
  "this is april",
  "dominate",
  "public culture"
]

# use method find_or_create_by so it mimic indempotency
brands.each do |brand_name|
    Product::Brand.find_or_create_by!(name: brand_name)
end