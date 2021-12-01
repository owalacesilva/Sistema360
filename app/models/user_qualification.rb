class UserQualification < ApplicationRecord
  belongs_to :user, validate: true, touch: true
  belongs_to :qualification, validate: true, touch: false
end
