require "rails_helper"

RSpec.describe Graduation, type: :model do
  
  context "when graduation is builded" do
    context "without unique name" do
      subject(:graduation) { build(:graduation, unique_name: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without display name" do
      subject(:graduation) { build(:graduation, display_name: nil) }

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
