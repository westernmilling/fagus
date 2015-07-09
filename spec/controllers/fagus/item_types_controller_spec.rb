require 'rails_helper'

module Fagus
  RSpec.describe ItemTypesController, :type => :controller do
    routes { Fagus::Engine.routes }

    before do
      allow(ItemType).to receive(:find) { item_type }
    end
    let(:item_type) { build_stubbed(:item_type) }

    describe 'GET edit' do
      before { get :edit, :id => item_type.id }

      it_behaves_like 'a successful request'
      it_behaves_like 'an edit request'
      it { expect(assigns(:item_type)).to be_kind_of(ItemType) }
    end

    describe 'GET index' do
      before do
        allow(controller).to receive(:item_types) { item_types }
        get :index
      end
      let(:item_types) do
        [
          build_stubbed(:item_type),
          build_stubbed(:item_type)
        ]
      end

      it_behaves_like 'a successful request'
      it_behaves_like 'an index request'
      it { expect(assigns(:item_types)).to be_kind_of(Array) }
      it { expect(assigns(:item_types)[0]).to be_kind_of(ItemType) }
      it { expect(assigns(:item_types).size).to eq(item_types.size) }
    end

    describe 'GET new' do
      before { get :new }

      it_behaves_like 'a successful request'
      it_behaves_like 'a new request'
      it { expect(assigns(:item_type)).to be_kind_of(ItemType) }
    end

    describe 'GET show' do
      before { get :show, :id => item_type.id }

      it_behaves_like 'a successful request'
      it_behaves_like 'a show request'
      it { expect(assigns(:item_type)).to be_kind_of(ItemType) }
    end

    describe 'PATCH update' do
      before do
        allow(item_type).to receive(:update_attributes) { update? }

        patch :update,
              :id => item_type.id,
              :category => attributes_for(:item_type)
      end
      let(:update?) { fail 'update? not set' }

      context 'when the update is successful' do
        let(:update?) { true }

        it_behaves_like 'a redirect'
        it { is_expected.to redirect_to(item_type_path(item_type.id)) }
        it do
          is_expected
            .to set_flash[:notice].to(I18n.t('fagus.item_type.update.success'))
        end
      end

      context 'when the update is not successful' do
        let(:update?) { false }

        it_behaves_like 'a successful request'
        it_behaves_like 'an edit request'
        it { expect(assigns(:item_type)).to be_kind_of(ItemType) }
        it do
          is_expected
            .to set_flash[:alert].to(I18n.t('fagus.item_type.update.failure'))
        end
      end
    end

    describe 'POST create' do
      before do
        allow(item_type).to receive(:save) { create? }
        allow(ItemType).to receive(:new) { item_type }

        post :create, :item_type => {}
      end
      let(:item_type) { build_stubbed(:item_type) }
      let(:create?) { fail 'create? not set' }

      context 'when the create is successful' do
        let(:create?) { true }

        it_behaves_like 'a redirect'
        it { is_expected.to redirect_to(item_type_path(item_type.id)) }
        it do
          is_expected
            .to set_flash[:notice].to(I18n.t('fagus.item_type.create.success'))
        end
      end

      context 'when the create is not successful' do
        let(:create?) { false }

        it_behaves_like 'a successful request'
        it_behaves_like 'a new request'
        it { expect(assigns(:item_type)).to be_kind_of(ItemType) }
        it do
          is_expected
            .to set_flash[:alert].to(I18n.t('fagus.item_type.create.failure'))
        end
      end
    end
  end
end
