class Wallet < ApplicationRecord
  belongs_to :user, optional: false
  has_many :transactions, dependent: :destroy
  has_many :withdraws, dependent: :destroy

  validates :user, presence: true
  validates :balance, presence: true
  validates :incomes, presence: true
  validates :expenses, presence: true
end
