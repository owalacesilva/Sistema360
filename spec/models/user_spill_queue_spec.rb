require "rails_helper"

RSpec.describe UserSpillQueue, type: :model do

  context "when user spill queue is created" do
    let(:user_sponsor) { create(:user) }
    let(:user) { create(:user, sponsor: user_sponsor) }

    before { Reference.create(title: "ACTIVATION") }

    context "with valid attributes" do
      subject(:user_spill_queue) do
        build(:user_spill_queue, user: user, user_sponsor: user_sponsor)
      end

      it { is_expected.to be_valid }
    end
  end

  context "when user spill_queue is builded" do
    context "without side" do
      subject(:user_spill_queue) { build(:user_spill_queue, side: nil) }

      it { is_expected.not_to be_valid }
    end
  end

  context "when user spill_queue is saved" do
    context "without user" do
      subject(:user_spill_queue) { build(:user_spill_queue, user: nil) }

      it "returns user required" do
        expect(user_spill_queue.save).to be_falsey
      end
    end

    context "without user sponsor" do
      subject(:user_spill_queue) { build(:user_spill_queue, user_sponsor: nil) }

      it "returns user sponsor required" do
        expect(user_spill_queue.save).to be_falsey
      end
    end
  end
end
