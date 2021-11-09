require 'rails_helper'

RSpec.describe "Backoffice::Tickets", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/backoffice/tickets/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/backoffice/tickets/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/backoffice/tickets/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/backoffice/tickets/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/backoffice/tickets/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/backoffice/tickets/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/backoffice/tickets/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
