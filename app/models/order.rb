class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  has_many :food_items, through: :order_items

  validates :customer, presence: true

  def total_price
    order_items.joins(:food_item).sum('order_items.quantity * food_items.price')
  end
end
