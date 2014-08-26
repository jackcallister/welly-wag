# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence([4, 8, 20].sample) }
    url { Faker::Internet.url }
    description { Faker::Lorem.sentence([4, 8, 20].sample) }
    user
  end
end
