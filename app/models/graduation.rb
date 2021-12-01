class Graduation < ApplicationRecord
  has_many :user_graduations
  has_many :users, through: :user_graduations

  validates :title, presence: true
  validates :volume, presence: true
  validates :max_points_by_team, presence: true
end
