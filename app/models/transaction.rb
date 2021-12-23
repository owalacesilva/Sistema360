class Transaction < ApplicationRecord
  belongs_to :origin_user, class_name: "User", optional: true
  belongs_to :target_user, class_name: "User", optional: true
  belongs_to :target_wallet, class_name: "Wallet", optional: true
  belongs_to :origin_wallet, class_name: "Wallet", optional: true
  belongs_to :reference, optional: true
  belongs_to :withdraw, optional: false

  validates :description, presence: false
  validates :operation, presence: true
  validates :amount, presence: true
  validates :percentage, presence: false
  validates :point_amount, presence: true
end
