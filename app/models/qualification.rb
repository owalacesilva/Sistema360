class Qualification < ApplicationRecord
  has_and_belongs_to_many :users

  validates :title, presence: true
  validates :volume, presence: true
  validates :max_points_by_team, presence: true
end
