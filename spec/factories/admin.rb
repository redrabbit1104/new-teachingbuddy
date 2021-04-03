FactoryBot.define do
  factory :admin do
    admin_name             { Faker::Name.initials(number: 2) }
    email                  { Faker::Internet.free_email }
    password               { Faker::Internet.password(min_length: 6) }
    password_confirmation  { password }
    admin_last_name              { '入江' }
    admin_first_name             { '美由紀' }
  end
end