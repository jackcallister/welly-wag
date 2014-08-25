# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    user
    voteable_id 1
    voteable_type 'Post'
  end
end
