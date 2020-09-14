FactoryBot.define do
  factory :item do
    image { Faker::Avatar.image }
    name { Faker::Name.name }
    text { Faker::String.random }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id { 2 }
    status_id   { 2 }
    postage_id  { 2 }
    prefectures_id { 2 }
    shipping_date_id { 2 }
    association :user
  end
end
