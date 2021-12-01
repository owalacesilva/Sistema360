FactoryBot.define do
  factory :user_graduation do
    association :user, factory: :user, strategy: :build
    association :graduation, factory: :graduation, strategy: :build
  end
end
