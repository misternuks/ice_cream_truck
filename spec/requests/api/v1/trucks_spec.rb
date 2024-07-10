require 'rails_helper'

RSpec.describe "Api::V1::Trucks", type: :request do
  describe "GET /inventory" do
    let!(:truck) { create(:truck, name: 'Ice Cream Truck 1') }
    let!(:food_item1) { create(:food_item, name: 'Chocolate Ice Cream', stock: 10, price: 300, truck: truck) }
    let!(:food_item2) { create(:food_item, name: 'Strawberry Ice Cream', stock: 5, price: 250, truck: truck) }
    let!(:customer) { create(:customer) }

    before do
      order = create(:order, customer: customer)
      create(:order_item, order: order, food_item: food_item1, quantity: 2)
      create(:order_item, order: order, food_item: food_item2, quantity: 3)
    end

    it "returns the inventory and total sales for the truck" do
      get "/api/v1/trucks/#{truck.id}/inventory"

      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response['inventory'].size).to eq(2)
      expect(json_response['total_sales']).to eq(2 * 300 + 3 * 250)
    end
  end
end
