# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie do
    title "MyString"
    year 1
    description "MyText"
    director "MyString"
    cast "MyString"
  end
end
