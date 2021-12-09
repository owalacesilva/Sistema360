require 'rails_helper'

RSpec.describe Qualification, type: :model do
  
  context "when qualification is builded" do
    context "without title" do
      subject(:qualification) { build(:qualification, title: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without volume" do
      subject(:qualification) { build(:qualification, volume: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without max_points_by_team" do
      subject(:qualification) { build(:qualification, max_points_by_team: nil) }

      it { is_expected.not_to be_valid }
    end
  end
end
