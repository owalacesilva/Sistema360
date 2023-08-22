require 'rails_helper'

RSpec.describe "Auctions::Checkouts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/auctions/checkout/index"
      expect(response).to have_http_status(:success)
    end
  end

end
