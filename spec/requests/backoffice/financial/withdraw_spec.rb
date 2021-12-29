require 'rails_helper'

RSpec.describe "Backoffice::Financial::Withdraws", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/backoffice/financial/withdraw/index"
      expect(response).to have_http_status(:success)
    end
  end

end
