FactoryBot.define do
  factory :point_distribution do
    association :user, factory: :user, strategy: :build
    association :reference, factory: :reference, strategy: :build

    base_value { Faker::Number.between(from: 0.0, to: 100.0) }
    done { false }
    params { nil }
  end
end
