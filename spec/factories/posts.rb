# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "Example"
    url "http://example.com"
    description "Example description"
    user
  end
end
