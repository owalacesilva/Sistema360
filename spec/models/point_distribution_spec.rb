require "rails_helper"

RSpec.describe PointDistribution, type: :model do

  context "when build" do
    context "without base_value" do
      subject(:point_distribution) { build(:point_distribution, base_value: nil) }

      it { is_expected.not_to be_valid }
    end
  end

  context "when save" do
    context "without user" do
      subject(:point_distribution) { build(:point_distribution, user: nil) }

      it "returns user required" do
        expect(point_distribution.save).to be_falsey
      end
    end

    context "without reference" do
      subject(:point_distribution) { build(:point_distribution, reference: nil) }

      it "returns reference required" do
        expect(point_distribution.save).to be_falsey
      end
    end

    context "without order" do
      subject(:point_distribution) { build(:point_distribution, order: nil) }

      it "returns order required" do
        expect(point_distribution.save).to be_falsey
      end
    end
  end
end
