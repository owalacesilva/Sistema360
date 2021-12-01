class Reference < ApplicationRecord
  has_many :points, class_name: "UserPoint"
  has_many :distributions, class_name: "PointDistribution"
  has_many :point_records, class_name: "UserPointRecord"

  validates :title, presence: true
end
