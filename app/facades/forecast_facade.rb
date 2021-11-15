class ForecastFacade
  class << self
    def get_forecast(location)
      coordinates = MapFacade.get_coordinates(location)

      WeatherFacade.get_forecast(latitude: coordinates.latitude, longitude: coordinates.longitude)
    end
  end
end
