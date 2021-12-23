require "rails_helper"

RSpec.describe Withdraw, type: :model do

  context "when withdraw is builded" do
    context "without balance" do
      subject(:withdraw) { build(:withdraw, balance: nil) }

      it { is_expected.not_to be_valid }
    end
  end
end
