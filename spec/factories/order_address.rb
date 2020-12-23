FactoryBot.define do
  factory :order_address do
    postal_code { "222-2222" }
    prefecture_id { 2 }
    city { Faker::Lorem.sentence }
    address { Faker::Lorem.sentence }
    phone_number { 11111111111 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
