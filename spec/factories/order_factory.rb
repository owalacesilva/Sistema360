FactoryBot.define do
  factory :order do
    sequence(:number) { |n| n * 3 }
    reference_date { Time.zone.today }
    status { "pending" }
    item_total { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }
    shipment_total { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }
    payment_total { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }
    discount_total { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }
    total { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }

    trait :blocked do
      blocked { true }
      blocked_at { Time.zone.today }
    end

    trait :completed do
      status { "completed" }
      completed { true }
      completed_at { Time.zone.today }
    end

    trait :canceled do
      status { "canceled" }
      canceled { true }
      canceled_at { Time.zone.today }
    end
  end
end
