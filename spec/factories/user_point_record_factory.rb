FactoryBot.define do
  factory :user_point_record do
    association :user, factory: :user, strategy: :build
    association :reference, factory: :reference, strategy: :build

    record_date { Time.zone.today }
    amount { Faker::Number.between(from: 0.0, to: 1000.0) }
  end
end
