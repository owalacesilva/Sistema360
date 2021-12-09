require 'rails_helper'

RSpec.describe PointDistribution, type: :model do
  
  context "when point distribution is builded" do
    context "without base_value" do
      subject(:point_distribution) { build(:point_distribution, base_value: nil) }

      it { is_expected.not_to be_valid }
    end
  end
end
