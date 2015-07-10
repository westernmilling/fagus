require_dependency 'fagus/application_controller'

module Fagus
  class ItemsController < ApplicationController
    before_action :find_item, :only => [:edit, :show, :update]
    before_action :set_categories
    before_action :set_item_types

    def create
      @item = Item.new(item_params)

      if @item.save
        redirect_to item_path(@item),
                    :notice => t('fagus.item.create.success')
      else
        flash[:alert] = t('fagus.item.create.failure')
        render :new
      end
    end

    def edit; end

    def index
      @items = items
    end

    def new
      @item = Item.new
    end

    def show; end

    def update
      if @item.update_attributes(item_params)
        redirect_to item_path(@item),
                    :notice => t('fagus.item.update.success')
      else
        flash[:alert] = t('fagus.item.update.failure')
        render :edit
      end
    end

    protected

    def find_item
      @item = Item.find(params[:id])
    end

    def item_params
      params
        .require(:item)
        .permit(:category_id,
                :description,
                :is_active,
                :item_type_id,
                :reference,
                :status)
    rescue ActionController::ParameterMissing; {}
    end

    def items
      Item.order(:description).ransack(params[:q]).result.to_a
    end

    def set_categories
      @categories = Category.order(:description).to_a
    end

    def set_item_types
      @item_types = ItemType.order(:description).to_a
    end
  end
end
