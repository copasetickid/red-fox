FactoryGirl.define do
  factory :stock_item do
    name Faker::Commerce.product_name
    description "Best thing you'll ever buy!"
    price 199.99
    taxable true


    trait :no_tax do
      taxable false
    end

    trait :with_a_store do
      association :store
    end
  end
end
