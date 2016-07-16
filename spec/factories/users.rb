FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password "password"


    trait :with_stores do
      after(:create) do |instance|
        create_list :store, 2, store: instance
      end
    end

  end
end
