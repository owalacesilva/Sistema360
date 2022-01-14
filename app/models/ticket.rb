class Ticket < ApplicationRecord
  belongs_to :user, dependent: :destroy

  enum status: {
    pending: "pending",
    hold: "hold",
    resolved: "resolved",
    canceled: "canceled",
    closed: "closed",
  }, _default: :pending

  enum department: {
    ti: "ti",
    adminstrative: "administrative",
    finances: "finances",
    support: "support",
  }, _default: :pending

  enum priority: {
    low: "low",
    normal: "normal",
    high: "high",
  }, _default: :low

  validates :status, presence: true
  validates :subject, presence: true
  validates :department, presence: true
  validates :priority, presence: true
end
