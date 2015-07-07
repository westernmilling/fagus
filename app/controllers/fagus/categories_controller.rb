require_dependency 'fagus/application_controller'

module Fagus
  class CategoriesController < ApplicationController
    before_action :find_category, :only => [:edit, :show, :update]

    def create
      @category = Fagus::Category.new(category_params)

      if @category.save
        redirect_to(
          category_path(@category.id),
          :notice => t('fagus.category.create.success'))
      else
        flash[:alert] = t('fagus.category.create.failure')
        render :new
      end
    end

    def edit; end

    def index
      @categories = categories
    end

    def new
      @category = Fagus::Category.new
    end

    def show; end

    def update
      if @category.update_attributes(category_params)
        redirect_to(
          category_path(@category.id),
          :notice => t('fagus.category.update.success'))
      else
        flash[:alert] = t('fagus.category.update.failure')
        render :edit
      end
    end

    protected

    def category_params
      params
        .require(:category)
        .permit(:category_type, :description, :name, :reference)
    rescue ActionController::ParameterMissing; {}
    end

    def categories
      Fagus::Category.order(:name).ransack(params[:q]).result.to_a
    end

    def find_category
      @category = Fagus::Category.find(params[:id])
    end
  end
end
