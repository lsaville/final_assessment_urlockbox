FactoryGirl.define do
  factory :user do
    email "MyString"
    password "pass"
    password_digest "MyString"
    password_confirmation "pass"
  end
end
