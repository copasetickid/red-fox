FactoryGirl.define do
  factory :store do
    name Faker::Company.name
    association :user
  end
end
