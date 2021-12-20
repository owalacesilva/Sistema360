FactoryBot.define do
  factory :qualification do
    display_name { Faker::Nation.nationality }
    sequence(:unique_name) { |n| "QUAL_#{n}" }
    sequence(:volume) { |n| n * 1_500 }
    sequence(:max_points_by_team) { |n| n * 2_500 }
  end
end
