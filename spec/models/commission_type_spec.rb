require "rails_helper"

RSpec.describe CommissionType, type: :model do

  context "when commission type is saved" do
    context "with valid attributes" do
      let(:commission_type) { create(:commission_type) }

      it "returns a new commission type" do
        expect(commission_type.save).to eq(true)
      end
    end
  end

  context "when commission type is builded" do
    context "without unique name" do
      subject(:commission_type) { build(:commission_type, unique_name: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without display_name" do
      subject(:commission_type) { build(:commission_type, display_name: nil) }

      it { is_expected.not_to be_valid }
    end
  end

  context "when commission type is deleted" do
    context "with commissions" do
      let(:commission_type) { create(:commission_type) }

      it "is expected that not to include in .all" do
        commission_type.destroy
        expect(described_class.all).not_to include commission_type
      end
    end
  end
end
