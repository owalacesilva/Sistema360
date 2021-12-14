FactoryBot.define do
  factory :point_distribution do
    association :reference, factory: :reference, strategy: :build

    base_value { Faker::Number.between(from: 10, to: 1000) }
    done { false }
    params { nil }
  end
end
