class ProductCategory < ApplicationRecord
  validates :name, presence: true
  validates :display_name, presence: true
  validates :is_default, inclusion: { in: [true, false] }
end
