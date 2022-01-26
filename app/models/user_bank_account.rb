class UserBankAccount < ApplicationRecord
  belongs_to :user, validate: true, touch: true

  validates :bank_code, presence: true
  validates :bank_name, presence: false
  validates :account_type, presence: true
  validates :branch_number, presence: true
  validates :branch_code, presence: true
  validates :account_number, presence: true
  validates :account_code, presence: true
  validates :holder_name, presence: true
  validates :document_number, presence: true
  validates :operation, presence: false
end
