FactoryGirl.define do
  factory :store do
    name Faker::Company.name
    association :user

    trait :with_stock_items do
      after(:create) do |instance|
        create_list :stock_item, 2, store: instance
      end
    end
  end
end
