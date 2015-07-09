require_dependency 'fagus/application_controller'

module Fagus
  class ItemTypesController < ApplicationController
    before_action :find_item_type, :only => [:edit, :show, :update]

    def create
      @item_type = ItemType.new(item_type_params)

      if @item_type.save
        redirect_to item_type_path(@item_type),
                    :notice => t('fagus.item_type.create.success')
      else
        flash[:alert] = t('fagus.item_type.create.failure')
        render :new
      end
    end

    def edit; end

    def index
      @item_types = item_types
    end

    def new
      @item_type = ItemType.new
    end

    def show; end

    def update
      if @item_type.update_attributes(item_type_params)
        redirect_to item_type_path(@item_type),
                    :notice => t('fagus.item_type.update.success')
      else
        flash[:alert] = t('fagus.item_type.update.failure')
        render :edit
      end
    end

    protected

    def find_item_type
      @item_type = ItemType.find(params[:id])
    end

    def item_type_params
      params
        .require(:item_type)
        .permit(:description, :is_active)
    rescue ActionController::ParameterMissing; {}
    end

    def item_types
      ItemType.order(:description).ransack(params[:q]).result.to_a
    end
  end
end
