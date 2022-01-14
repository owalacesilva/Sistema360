class Ticket < ApplicationRecord
  belongs :user, dependent: :destroy

  enum status: %i[pending hold resolved canceled closed], _default: :pending

  validates :status, presence: true
  validates :subject, presence: true
  validates :department, presence: true
  validates :priority, presence: true
end
