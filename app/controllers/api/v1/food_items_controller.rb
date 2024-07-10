class Api::V1::FoodItemsController < ApplicationController
  def index
    food_items = FoodItem.all
    render json: food_items
  end

  def show
    food_item = FoodItem.find(params[:id])
    render json: food_item
  end
end
