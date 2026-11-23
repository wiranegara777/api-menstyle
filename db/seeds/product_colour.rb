menColors = [
  "black",
  "white",
  "grey",
  "charcoal",
  "navy",
  "light blue",
  "olive",
  "burgundy",
  "beige",
  "brown",
  "teal",
  "khaki",
  "tan",
  "denim blue",
]

menColors.each do |colour|
    Product::Colour.find_or_create_by!(name: colour)
end