FactoryBot.define do
  factory :buyer do
    postal { 111 - 1111 }
    city { Faker::Address.city }
    address { Faker::Address.street_name }
    phone { Faker::PhoneNumber.phone_number }
    # token { 4242424242424242 }
    prefectures_id { 2 }
    association :order
  end
end
