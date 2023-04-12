FactoryBot.define do
  factory :subscription do
    title { Faker::Subscription.plan }
    price { Faker::Number.between(from: 1.00, to: 10.00).round(2) }
    status { [0, 1].sample }
    frequency { [0, 1, 2].sample }
    tea
  end
end
