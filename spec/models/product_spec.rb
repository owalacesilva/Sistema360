require "rails_helper"

RSpec.describe Product, type: :model do

  describe "is not created" do
    context "without title" do
      subject(:product) { build(:product, title: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without permalink" do
      subject(:product) { build(:product, permalink: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without description" do
      subject(:product) { build(:product, description: nil) }

      it { is_expected.not_to be_valid }
    end
  end
end
