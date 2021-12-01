FactoryBot.define do
  factory :user_point do
    association :user, factory: :user, strategy: :build
    association :reference, factory: :reference, strategy: :build

    amount { Faker::Number.between(from: 0.0, to: 1000.0) }
  end
end
