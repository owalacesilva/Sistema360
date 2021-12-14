class UserNetwork < ApplicationRecord
  belongs_to :user, validate: true, touch: true
  belongs_to :user_sponsor, class_name: "User", validate: true, touch: true
  belongs_to :user_parent, class_name: "User", validate: true, touch: true

  validates :left, presence: true
  validates :right, presence: true
  validates :points, presence: true
end
