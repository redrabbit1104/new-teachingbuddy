FactoryBot.define do
  factory :room do
    target_id  { Faker::Number.number(digits: 1) }
  end
end