require 'rails_helper'

RSpec.describe UserPointRecord, type: :model do
  
  describe "is not created" do
    context "without user" do
      subject(:user_point_record) { build(:user_point_record, user: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without reference" do
      subject(:user_point_record) { build(:user_point_record, reference: nil, user: nil) }
  
      it { is_expected.not_to be_valid }
    end

    context "without record_date" do
      subject(:user_point_record) { build(:user_point_record, record_date: nil, user: nil) }
  
      it { is_expected.not_to be_valid }
    end

    context "without amount" do
      subject(:user_point_record) { build(:user_point_record, amount: nil, user: nil) }
  
      it { is_expected.not_to be_valid }
    end
  end
end
