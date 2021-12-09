require 'rails_helper'

RSpec.describe "Backoffice::Store::Confirmations", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/backoffice/store/confirmation/index"
      expect(response).to have_http_status(:success)
    end
  end

end
