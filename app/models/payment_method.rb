class PaymentMethod < ApplicationRecord
  validates :name, presence: true
  validates :display_name, presence: true
  validates :description, presence: true
  validates :position, presence: true
end
