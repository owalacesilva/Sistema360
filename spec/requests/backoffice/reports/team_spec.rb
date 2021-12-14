require 'rails_helper'

RSpec.describe "Backoffice::Reports::Teams", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/backoffice/reports/team/index"
      expect(response).to have_http_status(:success)
    end
  end

end
