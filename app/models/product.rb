class Product < ApplicationRecord

  validates :permalink, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :product_type, presence: true
  validates :price, presence: true
  validates :stock_quantity, presence: true
  validates :point_amount, presence: true
end
