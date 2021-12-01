require "rails_helper"

RSpec.describe UserGraduation, type: :model do
  
  describe "is not created" do
    context "without user" do
      subject(:user_graduation) { build(:user_graduation, user: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without graduation" do
      subject(:user_graduation) { build(:user_graduation, user: nil, graduation: nil) }
  
      it { is_expected.not_to be_valid }
    end
  end
end
