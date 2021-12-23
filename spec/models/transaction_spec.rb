require "rails_helper"

RSpec.describe Transaction, type: :model do

  context "when transaction is builded" do
    context "without operation" do
      subject(:transaction) { build(:transaction, operation: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without amount" do
      subject(:transaction) { build(:transaction, amount: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without percentage" do
      subject(:transaction) { build(:transaction, percentage: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without point_amount" do
      subject(:transaction) { build(:transaction, point_amount: nil) }

      it { is_expected.not_to be_valid }
    end
  end
end
