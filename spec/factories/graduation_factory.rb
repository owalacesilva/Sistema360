FactoryBot.define do
  factory :graduation do
    display_name { Faker::Nation.nationality }
    unique_name { Faker::Internet.username }
    sequence(:volume) { |n| n * 1_500 }
    sequence(:max_points_by_team) { |n| n * 2_500 }
  end
end
