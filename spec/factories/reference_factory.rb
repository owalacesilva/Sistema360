FactoryBot.define do
  factory :reference do

    sequence(:title) { |n| "REF_#{n}" }
  end
end
