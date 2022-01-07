class Qualification < ApplicationRecord
  has_many :user_qualifications, dependent: :destroy
  has_many :users, through: :user_qualifications

  validates :display_name, presence: true
  validates :unique_name, presence: true
  validates :volume, presence: true
  validates :max_points_by_team, presence: true

  scope :uname, ->(name) { find_by(unique_name: name) }
end
