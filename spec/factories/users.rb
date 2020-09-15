FactoryBot.define do
  factory :user do
    nickname              { 'アえ間' }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 7) }
    password_confirmation { password }
    family_name            { 'あ亜ア' }
    first_name             { 'あ亜ア' }
    kana_family_name       { 'アン' }
    kana_first_name        { 'アン' }
    birth_day              { Faker::Date.birthday }
  end
end
