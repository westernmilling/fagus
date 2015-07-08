require 'rails_helper'

module Fagus
  RSpec.describe ItemType, :type => :model do
    subject { create(:item_type) }

    it { is_expected.to have_many(:items) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:uuid) }
    it { is_expected.to validate_uniqueness_of(:description) }
    it { is_expected.to validate_uniqueness_of(:uuid) }

    describe '.new' do
      subject { Fagus::ItemType.new }

      its(:uuid) { is_expected.to be_present }
    end

    describe '#active?' do
      subject { build(:item_type, :is_active => is_active).active? }
      context 'when is_active is 0' do
        let(:is_active) { 0 }

        it { is_expected.to be false }
      end

      context 'when is_active is 1' do
        let(:is_active) { 1 }

        it { is_expected.to be true }
      end
    end
  end
end
