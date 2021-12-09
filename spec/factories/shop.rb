FactoryBot.define do
  factory :shop do
    name { Faker::Name.name }
    address { Faker::Address.full_address }
  end
end
