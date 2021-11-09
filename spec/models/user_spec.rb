require 'rails_helper'

RSpec.describe User, type: :model do
  let(:sponsor) { create(:user, :actived) }

  fcontext "when create model" do
    let(:user) { build(:user, :actived, sponsor: sponsor) }

    it "is valid with valid attributes" do
      expect(user).to be_valid
    end

    it "is not valid without a first_name" do
      user.first_name = nil
      expect(user).not_to be_valid
    end
  end
end
