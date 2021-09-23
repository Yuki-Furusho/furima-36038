FactoryBot.define do
  factory :item do
    name            {Faker::Name.initials(number: 2)}
    detail          {Faker::Lorem.sentence}
    category_id     {Faker::Number.within(range: 2..11)}
    condition_id    {Faker::Number.within(range: 2..7)}
    delivery_fee_id {Faker::Number.within(range: 2..3)}
    prov_id         {Faker::Number.within(range: 2..48)}
    ship_days_id    {Faker::Number.within(range: 2..4)}
    price           {Faker::Number.within(range: 300..9999999)}
    association :user
  end
end
