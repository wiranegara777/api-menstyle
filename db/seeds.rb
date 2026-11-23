# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# tolkien = Author.create({
#   name: "J. R. R. Tolkien",
#   bio: "John Ronald Reuel Tolkien was an english Writter"
# })

# Book.create([
#   {
#     title: 'The Hobbit',
#     genre: 'Fantasy',
#     pages: 310,
#     author: tolkien
#   },
#   {
#     title: 'The Fellowship of the Ring',
#     genre: 'Fantasy',
#     pages: 423,
#     author: tolkien
#   }
# ])
