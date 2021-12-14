require 'rails_helper'

RSpec.describe "Backoffice::Reports::Referrals", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/backoffice/reports/referral/index"
      expect(response).to have_http_status(:success)
    end
  end

end
