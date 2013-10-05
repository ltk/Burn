FactoryGirl.define do
  factory :user do
    account_email "email@address.com"
    password "so_secure"
    password_confirmation "so_secure"
  end
end
