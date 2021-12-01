class UserPointRecord < ApplicationRecord
  belongs_to :user, validate: true, touch: true
  belongs_to :reference, validate: true, touch: false

  validates :record_date, presence: true
  validates :amount, presence: true
end
