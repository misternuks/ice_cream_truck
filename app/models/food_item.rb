class FoodItem < ApplicationRecord
  belongs_to :truck
  has_many :order_items
  has_many :orders, through: :order_items

  validates :name, :price, :stock, :category, presence: true
end
