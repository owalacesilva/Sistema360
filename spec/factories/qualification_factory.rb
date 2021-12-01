FactoryBot.define do
  factory :qualification do
    title { Faker::Nation.nationality }
    sequence(:volume) { |n| n * 1_500 }
    sequence(:max_points_by_team) { |n| n * 2_500 }
  end
end
