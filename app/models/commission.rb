class Commission < ApplicationRecord
  belongs_to :type, class_name: "CommissionType", foreign_key: "type_id", optional: false
  belongs_to :reference, class_name: "Reference", optional: false
  belongs_to :qualification, class_name: "Qualification", optional: false

  validates :display_name, presence: true
  validates :percentage, presence: true
  validates :depth, presence: true
end
