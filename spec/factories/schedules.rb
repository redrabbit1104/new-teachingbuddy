FactoryBot.define do
  factory :schedule do
    subject  { Faker::Lorem.characters(number: 10, min_alpha: 4) }
    start_time { '10:00:00' }
    end_time { '12:00:00' }
    
    association :sdate
  end
end