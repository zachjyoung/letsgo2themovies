# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    body "MyText"
    movie_id 1
  end
end
