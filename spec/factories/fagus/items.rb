FactoryGirl.define do
  factory :item, :class => Fagus::Item do
    category
    description { Faker::Commerce.product_name }
    item_type
    reference { Faker::Number.number(5) }
    status :active
    uuid { UUID.generate(:compact) }
  end
end
