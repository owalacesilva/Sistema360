FactoryBot.define do
  factory :payment_method do
    name { Faker::Internet.username }
    description { Faker::Lorem.paragraph(sentence_count: 3) }
    display_name { Faker::Commerce.product_name }
    preferences { nil }
    preferences_source { nil }
    sequence(:position) { |n| n }
    blocked { false }

    trait :blocked do
      blocked { true }
      blocked_at { Time.zone.today }
    end
  end
end
