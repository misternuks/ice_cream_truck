require 'rails_helper'

RSpec.describe "Api::V1::Customers", type: :request do
  describe "POST /create" do
    it "creates a customer and returns http success" do
      customer_params = {
        customer: {
          name: "John Doe"
        }
      }

      post "/api/v1/customers", params: customer_params.to_json, headers: { 'Content-Type' => 'application/json' }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['name']).to eq('John Doe')
    end
  end
end
