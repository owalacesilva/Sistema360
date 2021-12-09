require "rails_helper"

RSpec.describe ProductCategory, type: :model do

  context "when product category is builded" do
    context "without name" do
      subject(:product_category) { build(:product_category, name: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without display_name" do
      subject(:product_category) { build(:product_category, display_name: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without description" do
      subject(:product_category) { build(:product_category, description: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without is_default" do
      subject(:product_category) { build(:product_category, is_default: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without tax_code" do
      subject(:product_category) { build(:product_category, tax_code: nil) }

      it { is_expected.not_to be_valid }
    end
  end
end
