# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name    { Faker::Name.first_name }
    last_name     { Faker::Name.last_name }
    uid           { Faker::Number.number(6) }
    access_token  { Faker::Lorem.characters }
  end
end
