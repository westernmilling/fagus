# Fagus
module Fagus
  # Represents an item.
  class Item < ActiveRecord::Base
    extend Enumerize

    after_initialize :ensure_uuid_present

    belongs_to :category
    belongs_to :item_type

    enumerize :status,
              :in => [:active, :discontinued, :phased_out],
              :default => :active

    validates \
      :category,
      :description,
      :item_type,
      :reference,
      :status,
      :uuid,
      :presence => true
    validates \
      :description,
      :reference,
      :uuid,
      :uniqueness => { :case_sensitive => false }

    class << self
      # Get the next reference value in sequence.
      def next_reference
        ((Item.lock.pluck(:reference).max || '0').to_i + 1).to_s
      end
    end

    def ensure_uuid_present
      self.uuid ||= UUID.generate(:compact)
    end
  end
end
