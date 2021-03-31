FactoryBot.define do
  factory :board do
    post        { Faker::Lorem.characters(number: 10, min_alpha: 4) }
    association :user
  end
end