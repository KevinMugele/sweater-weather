class RoadTripFacade
  class << self
    def get_road_trip(params)
      directions = MapFacade.get_directions(params)
      return RoadTrip.new(params) if directions.nil?

      forecast = WeatherFacade.get_forecast(latitude: directions.end_latitude, longitude: directions.end_longitude)

      RoadTrip.new(directions, forecast)
    end
  end
end
