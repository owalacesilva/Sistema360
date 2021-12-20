FactoryBot.define do
  factory :commission_type do
    display_name { Faker::Nation.nationality }
    sequence(:unique_name) { |n| "COMMI_#{n}" }
    description { Faker::Lorem.paragraph(sentence_count: 3) }
  end
end
