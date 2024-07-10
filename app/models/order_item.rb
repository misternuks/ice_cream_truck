class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :food_item

  validates :order, :food_item, :quantity, presence: true
  validate :sufficient_stock

  after_create :decrement_stock

  private

  def sufficient_stock
    if food_item.stock < quantity
      errors.add(:quantity, "SO SORRY!")
    end
  end

  def decrement_stock
    food_item.update(stock: food_item.stock - quantity)
  end
end
