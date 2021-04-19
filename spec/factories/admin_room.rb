FactoryBot.define do
  factory :admin_room do
    association :user
    association :admin
  end
end