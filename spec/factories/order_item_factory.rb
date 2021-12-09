FactoryBot.define do
  factory :order_item do
    quantity { Faker::Number.between(from: 1, to: 10) }
    price { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }
    cost_price { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }
    additional_tax_total { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }
  end
end
