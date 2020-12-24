FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    details { Faker::Lorem.sentence }
    price { 5000 }
    category_id { 2 }
    state_id { 2 }
    delivery_fee_id { 2 }
    delivery_source_id { 2 }
    delivery_day_id { 2 }
    association :user
  end
end
