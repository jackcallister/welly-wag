# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence([4, 8, 12].sample) }
    url { Faker::Internet.url }
    description ''
    user
  end
end
