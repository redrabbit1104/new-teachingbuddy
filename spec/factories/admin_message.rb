FactoryBot.define do
  factory :admin_message do
    content { Faker::Lorem.sentence }
    flag { '1'}

    association :user
    association :admin
    association :admin_room

    after(:build) do |admin_message|
      admin_message.image.attach(io: File.open('public/images/top.png'), filename: 'top.png')
    end
  end
end