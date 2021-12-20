class Reference < ApplicationRecord
  has_many :points, class_name: "UserPoint"
  has_many :distributions, class_name: "PointDistribution"
  has_many :point_records, class_name: "UserPointRecord"

  validates :display_name, presence: true
  validates :unique_name, presence: true

  scope :uname, ->(name) { find_by(unique_name: name) }
  scope :activation, -> { find_by(unique_name: "ACTIVATION") }
  scope :reactivation, -> { find_by(unique_name: "REACTIVATION") }
end
