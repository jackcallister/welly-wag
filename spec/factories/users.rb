# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{n + 1}-user@example.com" }
    sequence(:nickname) { |n| "#{n + 1}-nickname" }
    password 'password'
    password_confirmation 'password'
    code { Invite.generate.code }
  end
end
