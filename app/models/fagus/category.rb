module Fagus
  class Category < ActiveRecord::Base
    after_initialize :ensure_uuid_present

    validates \
      :description,
      :name,
      :reference,
      :uuid, :presence => true

    def active?
      is_active == 1
    end

    def ensure_uuid_present
      self.uuid ||= UUID.generate(:compact)
    end
  end
end
