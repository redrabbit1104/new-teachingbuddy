FactoryBot.define do
  factory :check do
    check  { '1' }

    association :user
    association :schedule
  end
end