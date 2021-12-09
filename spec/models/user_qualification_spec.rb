require "rails_helper"

RSpec.describe UserQualification, type: :model do
  
  context "when use qualification is builded" do
    context "without user" do
      subject(:user_qualification) { build(:user_qualification, user: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without qualification" do
      subject(:user_qualification) { build(:user_qualification, user: nil, qualification: nil) }
  
      it { is_expected.not_to be_valid }
    end
  end
end
