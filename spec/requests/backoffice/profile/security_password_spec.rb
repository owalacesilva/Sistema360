require 'rails_helper'

RSpec.describe "Backoffice::Profile::SecurityPasswords", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/backoffice/profile/security_password/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/backoffice/profile/security_password/update"
      expect(response).to have_http_status(:success)
    end
  end

end
