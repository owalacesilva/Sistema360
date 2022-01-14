class Ticket < ApplicationRecord
  belongs_to :user, dependent: :destroy

  enum status: %i[pending hold resolved canceled closed], _default: :pending
  enum department: %i[ti adminstrative finances support], _default: :pending
  enum priority: %i[low normal high]

  validates :status, presence: true
  validates :subject, presence: true
  validates :department, presence: true
  validates :priority, presence: true
end
