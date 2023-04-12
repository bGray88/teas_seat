FactoryBot.define do
  factory :subscription do
    title { Faker::Subscription.plan }
    price { Faker::Number.between(from: 10.00, to: 100.00).round(2) }
    status { [0, 1].sample }
    frequency { [0, 1, 2].sample }
    tea
  end
end
