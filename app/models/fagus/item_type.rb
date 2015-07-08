# Fagus
module Fagus
  # Represents the different types of items.
  class ItemType < ActiveRecord::Base
    after_initialize :ensure_uuid_present

    has_many :items

    validates \
      :description,
      :uuid,
      :presence => true
    validates \
      :description,
      :uuid,
      :uniqueness => true

    def active?
      is_active == 1
    end

    def ensure_uuid_present
      self.uuid ||= UUID.generate(:compact)
    end
  end
end
