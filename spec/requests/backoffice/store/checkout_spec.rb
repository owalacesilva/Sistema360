require 'rails_helper'

RSpec.describe "Backoffice::Store::Checkouts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/backoffice/store/checkout/index"
      expect(response).to have_http_status(:success)
    end
  end

end
