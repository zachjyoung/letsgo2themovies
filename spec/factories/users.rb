# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username 'mallgoats'
    email 'test@test.com'
    password 'mallgoats'
  end
end
