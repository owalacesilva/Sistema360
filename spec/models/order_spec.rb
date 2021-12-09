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
end
