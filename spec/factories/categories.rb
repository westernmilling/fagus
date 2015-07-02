FactoryGirl.define do
  factory :category, :class => Fagus::Category do
    description { "#{reference} - #{name}" }
    is_active 1
    name { Faker::Lorem.word }
    reference { Faker::Number.number(3) }
    uuid { UUID.generate(:compact) }
  end
end
