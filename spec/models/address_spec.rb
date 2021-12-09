require "rails_helper"

RSpec.describe Address, type: :model do
  
  context "when address is builded" do
    context "with valid attributes" do
      subject(:address) { build(:address) }

      it { is_expected.to be_valid }
    end
  end
end
