require 'rails_helper'

RSpec.describe "Backoffice::Store::Shippings", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/backoffice/store/shipping/index"
      expect(response).to have_http_status(:success)
    end
  end

end
