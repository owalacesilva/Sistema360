FactoryBot.define do
  factory :user_spill_queue do
    side { "L" }

    trait :spilled do
      spilled { true }
      spilled_at { Time.zone.today }
    end
  end
end
