require 'rails_helper'

RSpec.describe Commission, type: :model do
  let(:commission_type) { create(:commission_type) }
  let(:qualification) { create(:qualification) }
  let(:reference) { create(:reference) }

  context "when commission is saved" do
    context "with valid attributes" do
      let(:commission) { create(:commission, type: commission_type, qualification: qualification, reference: reference) }

      it "returns a new commission" do
        expect(commission.save).to eq(true)
      end
    end
  end

  context "when commission is builded" do
    context "without display_name" do
      subject(:commission) do
        build(:commission, type: commission_type, qualification: qualification, reference: reference, display_name: nil)
      end

      it { is_expected.not_to be_valid }
    end

    context "without percentage" do
      subject(:commission) do
        build(:commission, type: commission_type, qualification: qualification, reference: reference, percentage: nil)
      end

      it { is_expected.not_to be_valid }
    end

    context "without depth" do
      subject(:commission) do
        build(:commission, type: commission_type, qualification: qualification, reference: reference, depth: nil)
      end

      it { is_expected.not_to be_valid }
    end

    context "without type" do
      subject(:commission) do
        build(:commission, type: nil, qualification: qualification, reference: reference)
      end

      it { is_expected.not_to be_valid }
    end

    context "without qualification" do
      subject(:commission) do
        build(:commission, type: commission_type, qualification: nil, reference: reference)
      end

      it { is_expected.not_to be_valid }
    end

    context "without reference" do
      subject(:commission) do
        build(:commission, type: commission_type, qualification: qualification, reference: nil)
      end

      it { is_expected.not_to be_valid }
    end
  end

  context "when commission is deleted" do
    context "with commissions" do
      let(:commission) { create(:commission, type: commission_type, qualification: qualification, reference: reference) }

      it "is expected that not to include in .all" do
        commission.destroy
        expect(described_class.all).not_to include commission
      end
    end
  end
end
