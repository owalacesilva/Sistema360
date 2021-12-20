FactoryBot.define do
  factory :commission do
    display_name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph(sentence_count: 3) }
    percentage { Faker::Number.between(from: 10, to: 1000) }
    depth { 1 }
  end
end
