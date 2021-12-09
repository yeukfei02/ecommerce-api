FactoryBot.define do
  factory :book do
    association :shop, factory: :shop
    association :user, factory: :user
    name { Faker::Name.name }
    author { Faker::Name.name }
    price { Faker::Number.decimal(l_digits: 3, r_digits: 3) }
    quantity { Faker::Number.number(digits: 3) }
  end
end
