FactoryBot.define do
  factory :ticket do
    subject { Faker::Nation.nationality }

    message { Faker::Lorem.paragraph(sentence_count: 3) }
    reply { Faker::Lorem.paragraph(sentence_count: 3) }
    department { "TI" }
    priority { "low" }
    status { "pending" }

    trait :hold do
      status { "hold" }
    end
  end
end
