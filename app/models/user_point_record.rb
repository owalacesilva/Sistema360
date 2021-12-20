class UserPointRecord < ApplicationRecord
  belongs_to :user, validate: true, touch: true
  belongs_to :origin_user, class_name: "User", validate: true, touch: true
  belongs_to :reference, validate: true, touch: false
  belongs_to :point_distribution, optional: true
  belongs_to :commission, optional: true

  validates :record_date, presence: true
  validates :base_value, presence: true
  validates :amount, presence: true
end
