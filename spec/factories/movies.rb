# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie do
    title "Pulp Fiction"
    year 1994
    description "5 vignettes of awesomeness"
    director "Quentin Tarintino"
    cast "John Travolta, Samuel L. Jackson, Bruce Willis"
  end
end
