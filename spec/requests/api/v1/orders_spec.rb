require 'rails_helper'

RSpec.describe "Api::V1::Orders", type: :request do
  describe "POST /create" do
    let(:customer) { create(:customer) }
    let(:food_item1) { create(:food_item, stock: 10) }
    let(:food_item2) { create(:food_item, stock: 5) }

    context "with valid parameters" do
      it "creates an order and decrements stock" do
        order_params = {
          order: {
            customer_name: customer.name,
            food_items: [
              { id: food_item1.id, quantity: 2 },
              { id: food_item2.id, quantity: 3 }
            ]
          }
        }

        expect {
          post "/api/v1/orders", params: order_params.to_json, headers: { 'Content-Type' => 'application/json' }
        }.to change(Order, :count).by(1)
          .and change(OrderItem, :count).by(2)
          .and change { food_item1.reload.stock }.by(-2)
          .and change { food_item2.reload.stock }.by(-3)

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)['message']).to eq('ENJOY!')
      end
    end

    context "with insufficient stock" do
      it "does not create an order and returns an error message" do
        order_params = {
          order: {
            customer_name: customer.name,
            food_items: [
              { id: food_item1.id, quantity: 11 }  # More than available stock
            ]
          }
        }

        expect {
          post "/api/v1/orders", params: order_params.to_json, headers: { 'Content-Type' => 'application/json' }
        }.to_not change(Order, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['message']).to eq('SO SORRY!')
      end
    end
  end
end
