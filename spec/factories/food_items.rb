FactoryBot.define do
  factory :food_item do
    name { Faker::Food.ingredient }
    price { Faker::Commerce.price(range: 1..10) }
    stock { Faker::Number.between(from: 5, to: 20) }
    category { "Ice Cream" }
    association :truck
  end
end
