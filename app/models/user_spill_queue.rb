class UserSpillQueue < ApplicationRecord
  belongs_to :user, validate: true, touch: true
  belongs_to :user_sponsor, class_name: "User", validate: true, touch: true

  validates :side, presence: true
end
