require 'rails_helper'

RSpec.describe "Auctions::Homes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/auctions/home/index"
      expect(response).to have_http_status(:success)
    end
  end

end
