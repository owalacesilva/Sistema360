require "rails_helper"

RSpec.describe Ticket, type: :model do
  
  context "when ticket is builded" do
    context "without subject" do
      subject(:ticket) { build(:ticket, subject: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without department" do
      subject(:ticket) { build(:ticket, department: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without priority" do
      subject(:ticket) { build(:ticket, priority: nil) }

      it { is_expected.not_to be_valid }
    end
  end
end
