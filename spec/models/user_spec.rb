require "rails_helper"

RSpec.describe User, type: :model do
  
  describe "when build an user" do
    let(:sponsor) { create(:user, :actived) }

    context "without first_name" do
      subject(:user) { build(:user, first_name: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without last_name" do
      subject(:user) { build(:user, last_name: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without email" do
      subject(:user) { build(:user, email: nil) }

      it { is_expected.not_to be_valid }
    end
  end

  describe "when delete an user" do
    context "with sponsored" do
      let(:user) { create(:user_with_sponsored) }

      it "is expected that not to include in .all" do
        user.destroy
        expect(described_class.all).not_to include user
      end
    end

    context "with bank account" do
      let(:user) { create(:user_with_bank_account) }

      it "is expected that not to include in .all" do
        user.destroy
        expect(described_class.all).not_to include user
      end
    end

    context "with graduations" do
      let(:user) { create(:user_with_graduations) }

      it "is expected that not to include in .all" do
        user.destroy
        expect(described_class.all).not_to include user
      end
    end

    context "with qualifications" do
      let(:user) { create(:user_with_qualifications) }

      it "is expected that not to include in .all" do
        user.destroy
        expect(described_class.all).not_to include user
      end
    end

    context "with points" do
      let(:user) { create(:user_with_points) }

      it "is expected that not to include in .all" do
        user.destroy
        expect(described_class.all).not_to include user
      end
    end

    context "with point records" do
      let(:user) { create(:user_with_point_records) }

      it "is expected that not to include in .all" do
        user.destroy
        expect(described_class.all).not_to include user
      end
    end

    context "with point distributions" do
      let(:user) { create(:user_with_point_distributions) }

      it "is expected that not to include in .all" do
        user.destroy
        expect(described_class.all).not_to include user
      end
    end

    context "without relationships" do
      let(:user) { create(:user) }

      it "is expected that not to include in .all" do
        user.destroy
        expect(described_class.all).not_to include user
      end
    end
  end
end
