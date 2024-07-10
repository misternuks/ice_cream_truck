FactoryBot.define do
  factory :order_item do
    association :order
    association :food_item
    quantity { 1 }
  end
end
