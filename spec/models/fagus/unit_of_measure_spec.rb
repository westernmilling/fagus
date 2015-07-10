require 'rails_helper'

module Fagus
  RSpec.describe UnitOfMeasure, :type => :model do
    subject { create(:unit_of_measure) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:symbol) }
    it { is_expected.to validate_presence_of(:unit_type) }
    it { is_expected.to validate_presence_of(:uuid) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_uniqueness_of(:symbol) }
    it { is_expected.to validate_uniqueness_of(:uuid) }
    it do
      is_expected
        .to enumerize(:unit_type)
        .in(:area, :length, :quantity, :time, :volume, :weight, :packed)
    end

    describe '.new' do
      subject { Fagus::UnitOfMeasure.new }

      its(:uuid) { is_expected.to be_present }
    end
  end
end
