FactoryBot.define do
  factory :order_buyer do
    post_code { '000-0000' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    municipalities { Faker::Address.city }
    address { Faker::Address.street_name }
    telephone_num { Faker::Number.number(digits: 10) }
    building_name { Faker::Address.street_name }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
