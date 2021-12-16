require "rails_helper"

RSpec.describe UserNetwork, type: :model do

  context "when user network is created" do
    let(:user_sponsor) { create(:user) }
    let(:user_parent) { create(:user, sponsor: user_sponsor) }
    let(:user) { create(:user, sponsor: user_sponsor) }

    context "with valid attributes" do
      subject(:user_network) do
        build(:user_network, user: user, sponsor_node: user_sponsor.node, parent_node: user_parent.node)
      end

      it { is_expected.to be_valid }
    end
  end

  context "when user network is builded" do
    context "without left" do
      subject(:user_network) { build(:user_network, lft: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without right" do
      subject(:user_network) { build(:user_network, rgt: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without depth" do
      subject(:user_network) { build(:user_network, depth: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without points" do
      subject(:user_network) { build(:user_network, points: nil) }

      it { is_expected.not_to be_valid }
    end
  end

  context "when user network is saved" do
    context "without user" do
      subject(:user_network) { build(:user_network, user: nil) }

      it "returns user required" do
        expect(user_network.save).to be_falsey
      end
    end

    context "without user sponsor" do
      subject(:user_network) { build(:user_network, sponsor_node: nil) }

      it "returns user sponsor required" do
        expect(user_network.save).to be_falsey
      end
    end

    context "without user parent" do
      subject(:user_network) { build(:user_network, parent_node: nil) }

      it "returns user parent required" do
        expect(user_network.save).to be_falsey
      end
    end
  end
end
