FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { '氏名' }
    first_name { '名前' }
    last_name_kana { 'シメイ' }
    first_name_kana { 'ナマエ' }
    birthday { Faker::Date.between(from: '1930-01-01', to: Date.today) }
  end
end
