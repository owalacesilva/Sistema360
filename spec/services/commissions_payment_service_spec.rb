require "rails_helper"

def user_point_from_ref(user, ref)
  user.point(ref)
end

def user_amount_point_from_ref(user, ref)
  user_point = user_point_from_ref(user, ref)
  user_point.amount
end

def user_wallet_balance(user)
  user.wallet.balance
end

def adds_points_to_user(user, ref, value)
  user_point = user_point_from_ref(user, ref)
  user_point.increment_points!(value)
end

RSpec.describe CommissionsPaymentService do
  context "with valid parameters" do
    let(:user) { create(:user) }
    let(:service) { described_class.call(user) }
    let(:amount) { 130 }

    before do
      adds_points_to_user(user, "activation", amount)
      adds_points_to_user(user, "reactivation", amount)
      user.reload
    end

    it "returns success status" do
      expect(service).to be_success
    end

    it "is expected that transactions is not empty" do
      expect(service.result[:transactions]).not_to be_empty
    end

    it "is expected transactions lenght is equal to 2" do
      expect(service.result[:transactions].count).to eq 2
    end

    it "is expected that total amount is equal to 260" do
      expect(service.result[:total_amount]).to eq 260
    end

    context "with user values testing only" do
      before { service }

      it "is expected that user points is empty" do
        expect(user.total_amount_points).to eq 0
      end

      it "is expected that user wallet balance is equal to 260" do
        service
        expect(user.wallet.balance).to eq 260
      end
    end
  end

  context "with user invalid parameters" do
    let(:service) { described_class.call(nil) }
    let(:errors) { { :errors => ["User invalid"] } }

    it "returns not success status" do
      expect(service).not_to be_success
    end

    it "is expected errors message" do
      expect(service.errors).to eq errors
    end
  end
end
