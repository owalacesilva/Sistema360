FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birth_date { Faker::Date.backward(days: 10950) } # 30 years
    phone_number { Faker::PhoneNumber.phone_number }
    personal_number { Faker::PhoneNumber.cell_phone }
    gender { "male" }
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
    
    transient do
      qualify { "empreendedor" }
    end

    trait :root do
      username { "t001" }
      first_name { "Root" }
      last_name { "Member" }
      email { "t@email.com" }
      password { "123456" }
    end

    trait :actived do
      status { User.statuses[:actived] }
    end

    trait :blocked do
      blocked { true }
      blocked_at { Time.zone.today }
    end

    trait :verified do
      verified { true }
      verified_at { Time.zone.today }
    end

    after(:create) do |user, evaluator|
      user.qualifications << Qualification.uname(evaluator.qualify)
      user.save
      user.reload
    end

    factory :user_with_sponsored do
      transient do
        sponsored_count { 5 }
      end

      after(:create) do |user, evaluator|
        create_list(:user, evaluator.sponsored_count, sponsor: user)

        user.reload
      end
    end

    factory :user_with_bank_account do
      after(:create) do |user|
        create(:user_bank_account, user: user)

        user.reload
      end
    end

    factory :user_with_graduations do
      transient do
        graduations_count { 5 }
      end

      after(:create) do |user, evaluator|
        graduations_list = create_list(:graduation, evaluator.graduations_count)

        user.graduations << graduations_list
        user.save!
      end
    end

    factory :user_with_qualifications do
      transient do
        qualifications_count { 5 }
      end

      after(:create) do |user, evaluator|
        qualifications_list = create_list(:qualification, evaluator.qualifications_count)

        user.qualifications << qualifications_list
        user.save!
      end
    end

    factory :user_with_points do
      transient do
        points_count { 5 }
      end

      after(:create) do |user, evaluator|
        point_amount = Random.rand(10...120)
        create_list(:user_point, evaluator.points_count, user: user, amount: point_amount)

        user.reload
      end
    end

    factory :user_with_point_records do
      transient do
        point_records_count { 5 }
      end

      after(:create) do |user, evaluator|
        point_amount = Random.rand(10...120)
        create_list(:user_point_record, evaluator.point_records_count, user: user, amount: point_amount)

        user.reload
      end
    end

    factory :user_with_point_distributions do
      transient do
        point_distributions_count { 5 }
      end

      after(:create) do |user, evaluator|
        base_value = Random.rand(1...1_200)
        order = create(:order_complete)
        create_list(:point_distribution, evaluator.point_distributions_count, user: user, order: order,
          base_value: base_value)

        user.reload
      end
    end

    factory :user_spilled do
      after(:create) do |user|
        sponsor_node = create(:user_network, user: create(:user), lft: 1, rgt: 6, depth: 0)
        parent_node = create(:user_network, user: create(:user), lft: 2, rgt: 5, depth: 1)
        create(:user_network, user: user, sponsor_node: sponsor_node, parent_node: parent_node, 
               depth: 2, lft: 3, rgt: 4)

        user.reload
      end
    end
  end
end
