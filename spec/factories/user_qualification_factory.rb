FactoryBot.define do
  factory :user_qualification do
    association :user, factory: :user, strategy: :build
    association :qualification, factory: :qualification, strategy: :build
  end
end
