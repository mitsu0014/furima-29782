FactoryBot.define do
  factory :buyer do
    postal
    city
    address
    phone
    prefectures_id { 2 }
  end
end
