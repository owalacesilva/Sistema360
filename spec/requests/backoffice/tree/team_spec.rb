require 'rails_helper'

RSpec.describe "Backoffice::Tree::Teams", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/backoffice/tree/team/index"
      expect(response).to have_http_status(:success)
    end
  end

end
