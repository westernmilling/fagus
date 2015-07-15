require 'rails_helper'

module Fagus
  RSpec.describe UnitOfMeasuresController, :type => :controller do
    routes { Fagus::Engine.routes }

    before { allow(UnitOfMeasure).to receive(:find) { unit_of_measure } }
    let(:unit_of_measure) { build_stubbed(:unit_of_measure) }

    describe 'GET edit' do
      before { get :edit, :id => unit_of_measure.id }

      it_behaves_like 'a successful request'
      it_behaves_like 'an edit request'
      it { expect(assigns(:unit_of_measure)).to be_kind_of(UnitOfMeasure) }
    end

    describe 'GET index' do
      before do
        allow(controller).to receive(:unit_of_measures) { unit_of_measures }
        get :index
      end
      let(:unit_of_measures) { build_stubbed_list(:unit_of_measure, 2) }

      it_behaves_like 'a successful request'
      it_behaves_like 'an index request'
      it { expect(assigns(:unit_of_measures)).to be_kind_of(Array) }
      it { expect(assigns(:unit_of_measures)[0]).to be_kind_of(UnitOfMeasure) }
      it do
        expect(assigns(:unit_of_measures).size).to eq(unit_of_measures.size)
      end
    end

    describe 'GET new' do
      before { get :new }

      it_behaves_like 'a successful request'
      it_behaves_like 'a new request'
      it { expect(assigns(:unit_of_measure)).to be_kind_of(UnitOfMeasure) }
    end

    describe 'GET show' do
      before { get :show, :id => unit_of_measure.id }

      it_behaves_like 'a successful request'
      it_behaves_like 'a show request'
      it { expect(assigns(:unit_of_measure)).to be_kind_of(UnitOfMeasure) }
    end

    describe 'PATCH update' do
      before do
        allow(unit_of_measure).to receive(:update_attributes) { update? }

        patch :update,
              :id => unit_of_measure.id,
              :category => attributes_for(:unit_of_measure)
      end
      let(:update?) { fail 'update? not set' }

      context 'when the update is successful' do
        let(:update?) { true }

        it_behaves_like 'a redirect'
        it do
          is_expected.to redirect_to(unit_of_measure_path(unit_of_measure.id))
        end
        it do
          is_expected
            .to set_flash[:notice]
            .to(I18n.t('fagus.unit_of_measure.update.success'))
        end
      end

      context 'when the update is not successful' do
        let(:update?) { false }

        it_behaves_like 'a successful request'
        it_behaves_like 'an edit request'
        it { expect(assigns(:unit_of_measure)).to be_kind_of(UnitOfMeasure) }
        it do
          is_expected
            .to set_flash[:alert]
            .to(I18n.t('fagus.unit_of_measure.update.failure'))
        end
      end
    end

    describe 'POST create' do
      before do
        allow(unit_of_measure).to receive(:save) { create? }
        allow(UnitOfMeasure).to receive(:new) { unit_of_measure }

        post :create, :unit_of_measure => {}
      end
      let(:create?) { fail 'create? not set' }

      context 'when the create is successful' do
        let(:create?) { true }

        it_behaves_like 'a redirect'
        it do
          is_expected.to redirect_to(unit_of_measure_path(unit_of_measure.id))
        end
        it do
          is_expected
            .to set_flash[:notice]
            .to(I18n.t('fagus.unit_of_measure.create.success'))
        end
      end

      context 'when the create is not successful' do
        let(:create?) { false }

        it_behaves_like 'a successful request'
        it_behaves_like 'a new request'
        it { expect(assigns(:unit_of_measure)).to be_kind_of(UnitOfMeasure) }
        it do
          is_expected
            .to set_flash[:alert]
            .to(I18n.t('fagus.unit_of_measure.create.failure'))
        end
      end
    end
  end
end
