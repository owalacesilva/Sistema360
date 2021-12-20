class CommissionType < ApplicationRecord
  has_many :commission, dependent: :destroy

  validates :display_name, presence: true
  validates :unique_name, presence: true

  scope :uname, ->(name) { find_by(unique_name: name) }
end
