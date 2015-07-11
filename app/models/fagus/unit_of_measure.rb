module Fagus
  class UnitOfMeasure < ActiveRecord::Base
    extend Enumerize

    after_initialize :ensure_uuid_present

    enumerize :unit_type,
              :in => [
                :area, :length, :quantity, :time, :volume, :weight, :packed
              ]
    validates \
      :name,
      :symbol,
      :unit_type,
      :uuid,
      :presence => true
    validates \
      :name,
      :symbol,
      :uuid,
      :uniqueness => true

    def ensure_uuid_present
      self.uuid ||= UUID.generate(:compact)
    end
  end
end
