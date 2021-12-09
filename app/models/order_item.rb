class OrderItem < ApplicationRecord
  belongs_to :order, validate: true, touch: true
  belongs_to :product, validate: true, touch: false

  validates :quantity, presence: true
  validates :price, presence: true
  validates :cost_price, presence: true
  validates :additional_tax_total, presence: true
end
