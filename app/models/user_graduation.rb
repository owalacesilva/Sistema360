class UserGraduation < ApplicationRecord
  belongs_to :user, validate: true, touch: true
  belongs_to :graduation, validate: true, touch: false
end
