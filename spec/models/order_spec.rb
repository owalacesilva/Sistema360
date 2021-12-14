require "rails_helper"

RSpec.describe Order, type: :model do

  context "when order is builded" do
    context "without number" do
      subject(:order) { build(:order, number: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without reference_date" do
      subject(:order) { build(:order, reference_date: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without status" do
      subject(:order) { build(:order, status: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without item_total" do
      subject(:order) { build(:order, item_total: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without shipment_total" do
      subject(:order) { build(:order, shipment_total: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without payment_total" do
      subject(:order) { build(:order, payment_total: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without discount_total" do
      subject(:order) { build(:order, discount_total: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without total" do
      subject(:order) { build(:order, total: nil) }

      it { is_expected.not_to be_valid }
    end
  end

  context "when trying create" do
    context "without user" do
      subject(:order) { build(:order_complete, user: nil) }

      it "returns user required" do
        expect(order.save).to be_falsey
      end
    end

    context "without billing address" do
      subject(:order) { build(:order_complete, billing_address: nil) }

      it "returns billing_address required" do
        expect(order.save).to be_falsey
      end
    end

    context "without shipping address" do
      subject(:order) { build(:order_complete, shipping_address: nil) }

      it "returns shipping_address required" do
        expect(order.save).to be_falsey
      end
    end
  end
end
