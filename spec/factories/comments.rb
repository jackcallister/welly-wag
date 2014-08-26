# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    post
    user
    content "Test"
    parent_id 1
    parent_type "Post"
  end
end
