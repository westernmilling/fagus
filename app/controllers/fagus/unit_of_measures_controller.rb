require_dependency 'fagus/application_controller'

module Fagus
  class UnitOfMeasuresController < ApplicationController
    before_action :build_unit_of_measure, :only => [:edit, :update]
    before_action :find_unit_of_measure, :only => [:edit, :show, :update]

    def create
      @unit_of_measure = UnitOfMeasure.new(unit_of_measure_params)

      if @unit_of_measure.save
        redirect_to unit_of_measure_path(@unit_of_measure),
                    :notice => t('fagus.unit_of_measure.create.success')
      else
        flash[:alert] = t('fagus.unit_of_measure.create.failure')
        render :new
      end
    end

    def edit; end

    def index
      @unit_of_measures = unit_of_measures
    end

    def new
      @unit_of_measure = UnitOfMeasure.new
    end

    def show; end

    def update
      if @unit_of_measure.update_attributes(unit_of_measure_params)
        redirect_to unit_of_measure_path(@unit_of_measure),
                    :notice => t('fagus.unit_of_measure.update.success')
      else
        flash[:alert] = t('fagus.unit_of_measure.update.failure')
        render :edit
      end
    end

    protected

    def build_unit_of_measure
      @unit_of_measure = UnitOfMeasure.new
    end

    def find_unit_of_measure
      @unit_of_measure = UnitOfMeasure.find(params[:id])
    end

    def unit_of_measure_params
      params
        .require(:unit_of_measure)
        .permit(:name, :symbol, :unit_type)
    rescue ActionController::ParameterMissing; {}
    end

    def unit_of_measures
      UnitOfMeasure.order(:name).ransack(params[:q]).result.to_a
    end
  end
end
