FactoryBot.define do
  factory :user_network do
    left { 1 }
    right { 2 }
    depth { 1 }
    points { Faker::Number.between(from: 10, to: 1000) }
  end
end
