class Api::V1::OrdersController < ApplicationController
  def create
    customer = Customer.find_or_create_by(name: order_params[:customer_name])
    order = customer.orders.build

    order_params[:food_items].each do |item|
      food_item = FoodItem.find(item[:id])
      order.order_items.build(food_item: food_item, quantity: item[:quantity])
    end

    if order.save
      render json: { message: 'ENJOY!', order: order.as_json(include: { order_items: { include: :food_item } }) }, status: :created
    else
      render json: { message: 'SO SORRY!', errors: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_name, food_items: [:id, :quantity])
  end
end
