FactoryBot.define do
  factory :user_network do
    association :user, factory: :user, strategy: :build

    lft { 1 }
    rgt { 2 }
    depth { 0 }
    points { Faker::Number.between(from: 10, to: 1000) }
  end
end
