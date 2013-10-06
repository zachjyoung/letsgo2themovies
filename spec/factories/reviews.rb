# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    body "DIS IS DA BOMB"
    rating 4
    vote_count 0
    association :movie
    association :user
  end
end
