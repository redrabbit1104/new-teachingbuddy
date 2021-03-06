FactoryBot.define do
  factory :user do
    user_name              { Faker::Name.initials(number: 2) }
    email                  { Faker::Internet.free_email }
    password               { Faker::Internet.password(min_length: 6) }
    password_confirmation  { password }
    last_name              { '村井' }
    first_name             { '秀樹' }

    after(:build) do |user|
      user.avatar.attach(io: File.open('public/images/top.png'), filename: 'top.png')
    end
  end
end