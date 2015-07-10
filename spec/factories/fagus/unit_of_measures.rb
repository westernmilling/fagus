FactoryGirl.define do
  factory :unit_of_measure, :class => Fagus::UnitOfMeasure do
    name { Faker::Lorem.word }
    unit_type { Fagus::UnitOfMeasure.unit_type.values.sample }
    symbol { name.parameterize }
    uuid { UUID.generate(:compact) }
  end
end
