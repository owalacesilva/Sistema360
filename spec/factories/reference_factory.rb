FactoryBot.define do
  factory :reference do
    display_name { Faker::Nation.nationality }
    sequence(:unique_name) { |n| "REF_#{n}" }
  end
end
