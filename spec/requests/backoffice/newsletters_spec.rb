require 'rails_helper'

RSpec.describe "Backoffice::Newsletters", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/backoffice/newsletters/index"
      expect(response).to have_http_status(:success)
    end
  end

end
