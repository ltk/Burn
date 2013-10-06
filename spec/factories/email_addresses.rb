# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :email_address do
    address "MyString"
    user_id 1
    verified false
  end
end
