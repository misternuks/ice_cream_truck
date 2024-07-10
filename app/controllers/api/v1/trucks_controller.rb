class Api::V1::TrucksController < ApplicationController
  def inventory
    truck = Truck.find(params[:id])
    food_items = truck.food_items
    total_sales = Order.joins(order_items: :food_item).where(food_items: { id: food_items.pluck(:id) }).sum('order_items.quantity * food_items.price')

    render json: {
      truck: truck.name,
      inventory: food_items,
      total_sales: total_sales
    }
  end
end
