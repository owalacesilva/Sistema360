FactoryBot.define do
  factory :product do
    title { Faker::Commerce.product_name }
    permalink { Faker::Internet.url(host: "localhost") }
    description { Faker::Lorem.paragraph(sentence_count: 10, supplemental: true) }
    short_description { Faker::Lorem.paragraph(sentence_count: 2) }
    keywords { Faker::Lorem.words(number: 10) }
    product_type { "goods" }
    price { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }
    discount_price { Faker::Commerce.price(range: 0..100.0, as_string: false) }
    stock_quantity { Faker::Number.number(digits: 3) }

    blocked { false }
    published { false }
    featured { false }
    sold_out { false }

    width { Faker::Number.between(from: 0.0, to: 100.0) }
    height { Faker::Number.between(from: 0.0, to: 100.0) }
    length { Faker::Number.between(from: 0.0, to: 100.0) }
    weigth { Faker::Number.between(from: 0.0, to: 100.0) }
    point_amount { Faker::Number.number(digits: 3) }

    trait :blocked do
      blocked { true }
    end

    trait :published do
      published { true }
    end

    trait :featured do
      featured { true }
    end

    trait :unavailable do
      sold_out { true }
    end
  end
end
