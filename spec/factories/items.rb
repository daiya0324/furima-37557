FactoryBot.define do
  factory :item do
    name              {Faker::Lorem.sentence}
    description                {Faker::Lorem.sentence}
    category_id              { 2 }
    status_id { 2 }
    shipping_fee_burden_id            { 2 }
    prefecture_id             { 2 }
    shipping_date_id       { 2 }
    price        { 300 }
    association :user
  end
end
