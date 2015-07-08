require 'rails_helper'

module Fagus
  RSpec.describe CategoriesController, :type => :controller do
    routes { Fagus::Engine.routes }

    before do
      allow(Category).to receive(:find) { category }
    end
    let(:category) { build_stubbed(:category) }

    describe 'GET edit' do
      before { get :edit, :id => category.id }

      it_behaves_like 'a successful request'
      it_behaves_like 'an edit request'
      it { expect(assigns(:category)).to be_kind_of(Category) }
    end

    describe 'GET index' do
      before do
        allow(controller).to receive(:categories) { categories }
        get :index
      end
      let(:categories) do
        [
          build_stubbed(:category),
          build_stubbed(:category)
        ]
      end

      it_behaves_like 'a successful request'
      it_behaves_like 'an index request'
      it { expect(assigns(:categories)).to be_kind_of(Array) }
      it { expect(assigns(:categories)[0]).to be_kind_of(Category) }
      it { expect(assigns(:categories).size).to eq(categories.size) }
    end

    describe 'GET new' do
      before { get :new }

      it_behaves_like 'a successful request'
      it_behaves_like 'a new request'
      it { expect(assigns(:category)).to be_kind_of(Category) }
    end

    describe 'GET show' do
      before { get :show, :id => category.id }
      # let(:category) { build_stubbed(:category) }

      it_behaves_like 'a successful request'
      it_behaves_like 'a show request'
      it { expect(assigns(:category)).to be_kind_of(Category) }
    end

    describe 'PATCH update' do
      before do
        allow(category).to receive(:update_attributes) { update? }

        patch :update,
              :id => category.id,
              :category => attributes_for(:category)
      end
      let(:update?) { fail 'update? not set' }

      context 'when the update is successful' do
        let(:update?) { true }

        it_behaves_like 'a redirect'
        it { is_expected.to redirect_to(category_path(category.id)) }
        it do
          is_expected
            .to set_flash[:notice].to(I18n.t('fagus.category.update.success'))
        end
      end

      context 'when the update is not successful' do
        let(:update?) { false }

        it_behaves_like 'a successful request'
        it_behaves_like 'an edit request'
        it { expect(assigns(:category)).to be_kind_of(Category) }
        it do
          is_expected
            .to set_flash[:alert].to(I18n.t('fagus.category.update.failure'))
        end
      end
    end

    describe 'POST create' do
      before do
        allow(category).to receive(:save) { create? }
        allow(Category).to receive(:new) { category }

        post :create, :category => {}
      end
      let(:category) { build_stubbed(:category) }
      let(:create?) { fail 'create? not set' }

      context 'when the create is successful' do
        let(:create?) { true }

        it_behaves_like 'a redirect'
        it { is_expected.to redirect_to(category_path(category.id)) }
        it do
          is_expected
            .to set_flash[:notice].to(I18n.t('fagus.category.create.success'))
        end
      end

      context 'when the create is not successful' do
        let(:create?) { false }

        it_behaves_like 'a successful request'
        it_behaves_like 'a new request'
        it { expect(assigns(:category)).to be_kind_of(Category) }
        it do
          is_expected
            .to set_flash[:alert].to(I18n.t('fagus.category.create.failure'))
        end
      end
    end
  end
end
