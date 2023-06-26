require 'rails_helper'

RSpec.describe "Api::V1::Categories", type: :request do
  describe "POST /create" do
    let(:category_params) do
      attributes_for(:category)
    end
    context "when params are ok" do
      it "return https status created" do
        post "/api/v1/categories/create", params:{category: category_params}
        expect(response).to have_http_status(:created)
      end
    end
    context "when params are nil" do
      it "return http status bad request" do
        category_params = nil
        post "/api/v1/categories/create", params:{category: category_params}
        expect(response).to have_http_status(:bad_request)
      end
    end
    context "when param are repetead" do
      it "return http status bad request" do
        post "/api/v1/categories/create", params:{category: category_params}
        post "/api/v1/categories/create", params:{category: category_params}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "GET /show" do
    let(:category) { create(:category, name: "test", description: "testing") }
    context "when the category exists" do
      it "returns the category details" do
        get "/api/v1/categories/show/#{category.id}"
        expect(response).to have_http_status(:ok)

        category_response = JSON.parse(response.body)
        expect(category_response["name"]).to eq("test")
        expect(category_response["description"]).to eq("testing")
      end
    end

    context "when the category does not exist" do
      it "returns a not found error" do
        get "/api/v1/categories/show/999"
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
