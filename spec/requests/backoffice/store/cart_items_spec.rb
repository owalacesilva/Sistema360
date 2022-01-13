require 'rails_helper'

RSpec.describe "Backoffice::Store::CartItems", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/backoffice/store/cart_items/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /add_quantity" do
    it "returns http success" do
      get "/backoffice/store/cart_items/add_quantity"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /reduce_quantity" do
    it "returns http success" do
      get "/backoffice/store/cart_items/reduce_quantity"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/backoffice/store/cart_items/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
