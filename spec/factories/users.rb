FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password =  '1a' + Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    first_name { '名' }
    last_name { '性' }
    first_name_kana { 'メイ' }
    last_name_kana { 'セイ' }
    birthday { '2000-01-01' }
  end
end
