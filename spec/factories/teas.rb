FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { "You may drink it" }
    temperature { [0, 1].sample }
    brew_time { Faker::Number.between(from: 5, to: 10) }
  end
end
