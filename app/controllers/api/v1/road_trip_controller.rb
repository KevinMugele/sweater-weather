class Api::V1::RoadTripController < ApplicationController
  before_action :validate_api_key, only: [:index]
  before_action :validate_params, only: [:index]

  def create
    road_trip = RoadTripFacade.get_road_trip(road_trip_params)
    render json: RoadTripSerializer.new(road_trip)
  end

  private

  def road_trip_params
    params.permit(:origin, :destination)
  end

  def validate_api_key
    api_key = ApiKey.find_by(token: params[:api_key])

    invalid_api_key if api_key.nil?
  end

  def invalid_api_key
    render json: 'You have entered an invalid API key'
  end

  def validate_params
    raise ActionController::BadRequest if invalid_start? || invalid_end?
  end

  def invalid_start?
    params[:origin].nil? || params[:origin].empty?
  end

  def invalid_end?
    params[:destination].nil? || params[:destination].empty?
  end
end
