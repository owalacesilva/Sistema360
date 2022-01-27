require 'rails_helper'

RSpec.describe "Backoffice::Profile::Passwords", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/backoffice/profile/password/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/backoffice/profile/password/update"
      expect(response).to have_http_status(:success)
    end
  end

end
