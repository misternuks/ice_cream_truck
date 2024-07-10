class Truck < ApplicationRecord
  has_many :food_items
  validates :name, presence: true
end
