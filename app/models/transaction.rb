class Transaction < ApplicationRecord
  enum operation: { income: "income", expense: "expense" }

  belongs_to :origin_user, class_name: "User", optional: false
  belongs_to :target_user, class_name: "User", optional: false
  belongs_to :origin_wallet, class_name: "Wallet", inverse_of: :expense_transactions, optional: false
  belongs_to :target_wallet, class_name: "Wallet", inverse_of: :income_transactions, optional: false
  belongs_to :reference, optional: false
  belongs_to :withdraw, optional: true

  validates :description, presence: false
  validates :operation, presence: true
  validates :amount, presence: true
  validates :percentage, presence: false
  validates :point_amount, presence: true
end
