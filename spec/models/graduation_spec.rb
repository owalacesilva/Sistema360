require "rails_helper"

RSpec.describe Graduation, type: :model do
  
  describe "is not created" do
    context "without title" do
      subject(:graduation) { build(:graduation, title: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without volume" do
      subject(:graduation) { build(:graduation, volume: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without max_points_by_team" do
      subject(:graduation) { build(:graduation, max_points_by_team: nil) }

      it { is_expected.not_to be_valid }
    end
  end
end
