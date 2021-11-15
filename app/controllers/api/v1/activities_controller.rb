class Api::V1::ActivitiesController < ApplicationController
  def index
    activity = ActivityFacade.get_activity(params[:destination])

    render json: ActivitiesSerializer.new(activity)
  end
end
