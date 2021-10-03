FactoryBot.define do
  factory :order_address do
    postal_code {'123-4567'}
    prov_id     {Faker::Number.within(range: 2..48)}
    city        {Gimei.city.kanji}
    address     {Gimei.town.kanji}
    building    {Faker::Address.street_suffix}
    phone       {Faker::Number.number(digits: 10)}
  end
end
