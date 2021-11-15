class Api::V1::ActivitiesController < ApplicationController
  before_action :validate_params, only: :index

  def index
    activity = ActivityFacade.get_activity(params[:destination])

    render json: ActivitiesSerializer.new(activity)
  end

  private

  def validate_params
    raise ActionController::BadRequest if invalid_params?
  end

  def invalid_params?
    params[:destination].nil? || params[:destination].empty?
  end
end
