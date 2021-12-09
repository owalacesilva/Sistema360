require 'rails_helper'

RSpec.describe UserPoint, type: :model do
  
  context "when user point is builded" do
    context "without user" do
      subject(:user_point_record) { build(:user_point_record, user: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without reference" do
      subject(:user_point_record) { build(:user_point_record, reference: nil, user: nil) }
  
      it { is_expected.not_to be_valid }
    end

    context "without amount" do
      subject(:user_point_record) { build(:user_point_record, amount: nil, user: nil) }
  
      it { is_expected.not_to be_valid }
    end
  end
end
