require 'rails_helper'

RSpec.describe "Backoffice::Store::Carts", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/backoffice/store/cart/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/backoffice/store/cart/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
