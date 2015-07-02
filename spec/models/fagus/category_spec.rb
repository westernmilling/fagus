require 'rails_helper'

module Fagus
  RSpec.describe Category, :type => :model do
    subject { build(:category) }

    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:reference) }
    it { is_expected.to validate_presence_of(:uuid) }

    describe '#active?' do
      subject { build(:category, :is_active => is_active).active? }
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
