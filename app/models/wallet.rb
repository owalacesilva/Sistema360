class Wallet < ApplicationRecord
  belongs_to :user, optional: false
  has_many :income_transactions, class_name: "Transaction", inverse_of: :origin_wallet, foreign_key: "origin_wallet_id",
                                 dependent: :destroy
  has_many :expense_transactions, class_name: "Transaction", inverse_of: :target_wallet, foreign_key: "origin_wallet_id",
                                  dependent: :destroy
  has_many :withdraws, dependent: :destroy

  validates :user, presence: true
  validates :balance, presence: true
  validates :incomes, presence: true
  validates :expenses, presence: true
end
