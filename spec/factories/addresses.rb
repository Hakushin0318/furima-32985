FactoryBot.define do
  factory :address do
    postal_code { "222-2222" }
    prefecture_id { 2 }
    city { Faker::Lorem.sentence }
    address { Faker::Lorem.sentence }
    phone_number { 11111111111 }
  end
end
