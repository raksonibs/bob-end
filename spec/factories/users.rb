FactoryGirl.define do
  factory :user do
    first_name 'Bob'
    last_name 'Bobrovosky'
    sequence(:email) { |n| "#{n}@presidentsomeday.com" }
    password 'password'
    password_confirmation 'password'
  end
end