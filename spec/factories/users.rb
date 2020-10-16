FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 3) }
    email { Faker::Internet.free_email }
    password = 'aaaaaaa1'
    password { password }
    password_confirmation { password }
    last_name { 'テスト' }
    first_name { '太郎' }
    last_name_kana { 'テスト' }
    first_name_kana { 'タロウ' }
    birthday { Faker::Date.backward(days: 365) }
  end
end
