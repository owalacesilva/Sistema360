require 'rails_helper'

RSpec.describe "Auctions::Products", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/auctions/products/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/auctions/products/show"
      expect(response).to have_http_status(:success)
    end
  end

end
