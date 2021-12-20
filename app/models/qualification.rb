class Qualification < ApplicationRecord
  has_and_belongs_to_many :users

  validates :display_name, presence: true
  validates :unique_name, presence: true
  validates :volume, presence: true
  validates :max_points_by_team, presence: true

  scope :uname, ->(name) { find_by(unique_name: name) }
end
