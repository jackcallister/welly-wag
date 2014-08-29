# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    nickname { Faker::Name.name }
    password 'password'
    password_confirmation 'password'
    code { Invite.generate.code }
  end
end
