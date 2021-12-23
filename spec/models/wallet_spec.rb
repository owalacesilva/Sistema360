require "rails_helper"

RSpec.describe Wallet, type: :model do

  context "when wallet is builded" do
    context "without balance" do
      subject(:wallet) { build(:wallet, balance: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without incomes" do
      subject(:wallet) { build(:wallet, incomes: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without expenses" do
      subject(:wallet) { build(:wallet, expenses: nil) }

      it { is_expected.not_to be_valid }
    end
  end
end
