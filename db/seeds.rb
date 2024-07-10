# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Deleting previous customers..."
Customer.destroy_all
puts "...Customers deleted."
puts "Deleting previous food items..."
FoodItem.destroy_all
puts "...Food items deleted."

puts "Creating new customers..."

Customer.create([
  { name: "Matthew" },
  { name: "Emma" },
  { name: "Thomas" }
])
puts "...Customers created."

puts "Creating new food items..."

FoodItem.create([
  { name: "Chocolate Ice Cream", price: 300, stock: 10, category: "Ice Cream" },
  { name: "Pistachio Ice Cream", price: 300, stock: 5, category: "Ice Cream" },
  { name: "Strawberry Ice Cream", price: 300, stock: 8, category: "Ice Cream" },
  { name: "Mint Ice Cream", price: 300, stock: 7, category: "Ice Cream" },
  { name: "Shaved Ice", price: 150, stock: 20, category: "Shaved Ice" },
  { name: "Snack Bar", price: 200, stock: 15, category: "Snack Bar" }
])

puts "...Food items created."
puts "All seeds planted."
