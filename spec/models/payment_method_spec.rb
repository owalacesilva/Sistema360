require "rails_helper"

RSpec.describe PaymentMethod, type: :model do

  context "when payment method is builded" do

    context "without name" do
      subject(:payment_method) { build(:payment_method, name: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without display_name" do
      subject(:payment_method) { build(:payment_method, display_name: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without description" do
      subject(:payment_method) { build(:payment_method, description: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without position" do
      subject(:payment_method) { build(:payment_method, position: nil) }

      it { is_expected.not_to be_valid }
    end
  end
end
