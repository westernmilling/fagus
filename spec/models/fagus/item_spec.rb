require 'rails_helper'

module Fagus
  RSpec.describe Item, :type => :model do
    subject { create(:item) }

    it { is_expected.to belong_to(:category) }
    it { is_expected.to belong_to(:item_type) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:item_type) }
    it { is_expected.to validate_presence_of(:reference) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:uuid) }
    it { is_expected.to validate_uniqueness_of(:reference).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:uuid).case_insensitive }
    it do
      is_expected
        .to enumerize(:status)
        .in(:active, :phased_out, :discontinued)
        .with_default(:active)
    end

    describe '.new' do
      subject { Fagus::Item.new }

      its(:uuid) { is_expected.to be_present }
    end

    describe '.next_reference' do
      subject { Fagus::Item.next_reference }

      context 'when there are no existing items' do
        it { is_expected.to eq('1') }
      end

      context 'when there are existing items' do
        before do
          create(:item, :reference => '1000000')
          create(:item, :reference => '1000001')
        end

        it { is_expected.to eq('1000002') }
      end
    end
  end
end
