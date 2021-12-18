class UserNetwork < ApplicationRecord
  belongs_to :user, validate: true, touch: true
  belongs_to :sponsor_node, class_name: "UserNetwork", optional: true, touch: true
  belongs_to :parent_node, class_name: "UserNetwork", optional: true, touch: true

  validates :lft, presence: true
  validates :rgt, presence: true
  validates :points, presence: true

  scope :order_by_right_desc, -> { order(rgt: :desc) }
  scope :right_latest, -> { order_by_right_desc.first }
  scope :nodes_from_target, ->(target) { where("rgt >= :target", target: target) }
end
