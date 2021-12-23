class Withdraw < ApplicationRecord
  belongs_to :wallet, class_name: "Wallet", optional: true

  validates :balance, presence: true
end
