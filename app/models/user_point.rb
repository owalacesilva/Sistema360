class UserPoint < ApplicationRecord
  belongs_to :user, validate: true, touch: true
  belongs_to :reference, validate: true, touch: false

  validates :amount, presence: true
  # validates :user, uniqueness: { scope: :reference }

  def increment_points!(value)
    self.amount += value
    save!
  end
end
