FactoryBot.define do
  factory :product_category do
    name { Faker::Internet.username }
    display_name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph(sentence_count: 3) }
    is_default { false }
    tax_code { Faker::Lorem.words(number: 1) }

    trait :default do
      is_default { true }
    end
  end
end
