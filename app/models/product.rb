class Product < ApplicationRecord
  belongs_to :category, class_name: "ProductCategory", validate: true, optional: false

  validates :permalink, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :product_type, presence: true
  validates :price, presence: true
  validates :stock_quantity, presence: true
  validates :point_amount, presence: true
end
