FactoryBot.define do
  factory :order do
    association :shop, factory: :shop
    association :user, factory: :user
    order_detail { Faker::Lorem.word }
  end
end
