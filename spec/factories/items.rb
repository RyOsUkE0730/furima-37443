FactoryBot.define do
  factory :item do
    category_id { Faker::Number.between(from: 1, to: 10) }
    condition_id { Faker::Number.between(from: 1, to: 6) }
    delivery_charge_id { Faker::Number.between(from: 1, to: 2) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    delivery_time_id { Faker::Number.between(from: 1, to: 3) }
    item_name { Faker::Name.name }
    description { Faker::Name.name }
    selling_price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
