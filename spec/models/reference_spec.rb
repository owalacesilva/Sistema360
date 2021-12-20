require "rails_helper"

RSpec.describe Reference, type: :model do
  
  context "when reference is builded" do
    context "without unique name" do
      subject(:reference) { build(:reference, unique_name: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without display name" do
      subject(:reference) { build(:reference, display_name: nil) }

      it { is_expected.not_to be_valid }
    end
  end
end
