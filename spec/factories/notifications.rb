# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    message "MyString"
    recipient_id 1
    sender_type "MyString"
    sender_id 1
  end
end
