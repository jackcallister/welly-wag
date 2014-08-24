# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{n + 1}-user@example.com" }
    password 'password'
    password_confirmation 'password'
    nickname "Example"
    avatar_url "http://robohash.org/user@example.com.png"
  end
end
