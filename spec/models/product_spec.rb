require "rails_helper"

RSpec.describe Product, type: :model do

  context "when product is builded" do
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

  context "when try it create" do
    context "without category" do
      subject(:product) { build(:product, category: nil) }

      it "returns category required" do
        expect(product.save).not_to be(true)
      end
    end
  end
end
