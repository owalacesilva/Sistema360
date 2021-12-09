require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  
  context "when order item is builded" do
    context "without quantity" do
      subject(:order_item) { build(:order_item, quantity: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without price" do
      subject(:order_item) { build(:order_item, price: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without cost_price" do
      subject(:order_item) { build(:order_item, cost_price: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without additional_tax_total" do
      subject(:order_item) { build(:order_item, additional_tax_total: nil) }

      it { is_expected.not_to be_valid }
    end
  end
end
