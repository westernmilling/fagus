FactoryGirl.define do
  factory :item_type, :class => Fagus::ItemType do
    description { Faker::Commerce.department }
    is_active 1
    uuid { UUID.generate(:compact) }
  end
end
