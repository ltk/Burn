# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inbound_message do
    raw "MyText"
    headers "MyText"
    from_email "MyString"
    to "MyText"
    email "MyString"
    subject "MyText"
    spam_score 1
    spf_result "MyString"
    dkim_valid false
    burner_id 1
  end
end
