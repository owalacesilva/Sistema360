FactoryBot.define do
  factory :transaction do
    operation { "income" }
    amount { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }
    percentage { Faker::Number.between(from: 1, to: 10) }
    point_amount { Faker::Number.between(from: 100, to: 1_000) }
  end
end
