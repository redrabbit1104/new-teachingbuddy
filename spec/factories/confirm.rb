FactoryBot.define do
  factory :confirm do
    check  { '1' }

    association :user
    association :schedule
  end
end