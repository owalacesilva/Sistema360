FactoryBot.define do
  factory :withdraw do
    balance { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }    
  end
end
