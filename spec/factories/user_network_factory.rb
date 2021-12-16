FactoryBot.define do
  factory :user_network do
    lft { 1 }
    rgt { 2 }
    depth { 0 }
    points { Faker::Number.between(from: 10, to: 1000) }
  end
end
