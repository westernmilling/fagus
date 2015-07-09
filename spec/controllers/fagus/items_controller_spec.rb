require 'rails_helper'

module Fagus
  RSpec.describe ItemsController, :type => :controller do
    routes { Fagus::Engine.routes }

    before do
      allow(Item).to receive(:find) { item }
    end
    let(:item) { build_stubbed(:item) }

    describe 'GET edit' do
      before { get :edit, :id => item.id }

      it_behaves_like 'a successful request'
      it_behaves_like 'an edit request'
      it { expect(assigns(:item)).to be_kind_of(Item) }
    end

    describe 'GET index' do
      before do
        allow(controller).to receive(:items) { items }
        get :index
      end
      let(:items) { build_stubbed_list(:item, 2) }

      it_behaves_like 'a successful request'
      it_behaves_like 'an index request'
      it { expect(assigns(:items)).to be_kind_of(Array) }
      it { expect(assigns(:items)[0]).to be_kind_of(Item) }
      it { expect(assigns(:items).size).to eq(items.size) }
    end

    describe 'GET new' do
      before { get :new }

      it_behaves_like 'a successful request'
      it_behaves_like 'a new request'
      it { expect(assigns(:item)).to be_kind_of(Item) }
    end

    describe 'GET show' do
      before { get :show, :id => item.id }

      it_behaves_like 'a successful request'
      it_behaves_like 'a show request'
      it { expect(assigns(:item)).to be_kind_of(Item) }
    end

    describe 'PATCH update' do
      before do
        allow(item).to receive(:update_attributes) { update? }

        patch :update,
              :id => item.id,
              :category => attributes_for(:item)
      end
      let(:update?) { fail 'update? not set' }

      context 'when the update is successful' do
        let(:update?) { true }

        it_behaves_like 'a redirect'
        it { is_expected.to redirect_to(item_path(item.id)) }
        it do
          is_expected
            .to set_flash[:notice].to(I18n.t('fagus.item.update.success'))
        end
      end

      context 'when the update is not successful' do
        let(:update?) { false }

        it_behaves_like 'a successful request'
        it_behaves_like 'an edit request'
        it { expect(assigns(:item)).to be_kind_of(Item) }
        it do
          is_expected
            .to set_flash[:alert].to(I18n.t('fagus.item.update.failure'))
        end
      end
    end

    describe 'POST create' do
      before do
        allow(item).to receive(:save) { create? }
        allow(Item).to receive(:new) { item }

        post :create, :item => {}
      end
      let(:item) { build_stubbed(:item) }
      let(:create?) { fail 'create? not set' }

      context 'when the create is successful' do
        let(:create?) { true }

        it_behaves_like 'a redirect'
        it { is_expected.to redirect_to(item_path(item.id)) }
        it do
          is_expected
            .to set_flash[:notice].to(I18n.t('fagus.item.create.success'))
        end
      end

      context 'when the create is not successful' do
        let(:create?) { false }

        it_behaves_like 'a successful request'
        it_behaves_like 'a new request'
        it { expect(assigns(:item)).to be_kind_of(Item) }
        it do
          is_expected
            .to set_flash[:alert].to(I18n.t('fagus.item.create.failure'))
        end
      end
    end
  end
end
