class CartItem < ApplicationRecord
  belongs_to :cart, validate: true, touch: true
  belongs_to :product, validate: true, touch: false

  validates :quantity, presence: true

  def total_price
    quantity * product.price
  end
end
