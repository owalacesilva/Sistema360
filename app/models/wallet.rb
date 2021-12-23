class Wallet < ApplicationRecord
  has_many :transactions, dependent: :destroy
  has_many :withdraws, dependent: :destroy

  validates :balance, presence: true
  validates :incomes, presence: true
  validates :expenses, presence: true
end
