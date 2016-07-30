FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{n}@presidentsomeday.com" }
    password 'password'
    password_confirmation 'password'
    ruby_amount 100
  end
end