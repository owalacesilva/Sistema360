class Cart < ApplicationRecord
  belongs_to :user, validate: true, touch: true
  has_many :items, class_name: "CartItem", autosave: true, dependent: :destroy

  validates :total, presence: true

  def sub_total
    items.sum(&:total_price)
  end
end
