class Api::V1::OrdersController < ApplicationController
  def create
    food_item = FoodItem.find(params[:food_item_id])
    order = food_item.orders.build(order_params)

    if order.save
      render json: { message: "ENJOY!", order: order}, status: :created
    else
      render json: { message: "SO SORRY!", errors: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:quantity)
  end
end
