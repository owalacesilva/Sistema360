require "rails_helper"

RSpec.describe UserBankAccount, type: :model do
  
  describe "is not created" do
    context "without user" do
      subject(:user_bank_account) { build(:user_bank_account, user: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without bank_code" do
      subject(:user_bank_account) { build(:user_bank_account, bank_code: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without bank_name" do
      subject(:user_bank_account) { build(:user_bank_account, bank_name: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without account_type" do
      subject(:user_bank_account) { build(:user_bank_account, account_type: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without branch_number" do
      subject(:user_bank_account) { build(:user_bank_account, branch_number: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without branch_code" do
      subject(:user_bank_account) { build(:user_bank_account, branch_code: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without account_number" do
      subject(:user_bank_account) { build(:user_bank_account, account_number: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without account_code" do
      subject(:user_bank_account) { build(:user_bank_account, account_code: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without holder_name" do
      subject(:user_bank_account) { build(:user_bank_account, holder_name: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without document_number" do
      subject(:user_bank_account) { build(:user_bank_account, document_number: nil) }

      it { is_expected.not_to be_valid }
    end

    context "without operation" do
      subject(:user_bank_account) { build(:user_bank_account, operation: nil) }

      it { is_expected.not_to be_valid }
    end
  end
end
