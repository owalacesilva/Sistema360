FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birth_date { Faker::Date.backward(days: 10950) } # 30 years
    phone_number { Faker::PhoneNumber.phone_number }
    personal_number { Faker::PhoneNumber.cell_phone }
    gender { 'male' }
    email { Faker::Internet.email }
    email_confirmation { email }
    password { Faker::Internet.password(min_length: 8) }

    postal_code { Faker::Address.postcode }
    street_address { Faker::Address.street_name }
    building_number { Faker::Address.building_number }
    recipient { Faker::Address.building_number }
    apartament { Faker::Address.building_number }
    door_code { Faker::Address.building_number }
    floor { Faker::Address.building_number }
    neighborhood { Faker::Address.community }
    city { Faker::Address.city }
    state { Faker::Address.state }
    state_abbr { Faker::Address.state_abbr }
    country { Faker::Address.country }
    country_code { Faker::Address.country_code }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }

    trait :root do
      username { 't001' }
      first_name { 'Root' }
      last_name { 'Member' }
      email { 't@email.com' }
      password { '123456' }
    end

    trait :actived do
      status { User.statuses[:actived] }
    end

    trait :blocked do
      blocked { true }
      blocked_at { Date.today }
    end

    trait :verified do
      verified { true }
      verified_at { Date.today }
    end
  end
end
