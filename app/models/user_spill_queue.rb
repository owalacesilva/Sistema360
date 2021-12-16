class UserSpillQueue < ApplicationRecord

  enum sides: { left: "left", right: "right" }

  belongs_to :user, validate: true, touch: true
  belongs_to :user_sponsor, class_name: "User", validate: true, touch: true

  validates :side, presence: true

  scope :not_spilled_by_old, -> { where(spilled: false).order(id: :asc) } 
end
