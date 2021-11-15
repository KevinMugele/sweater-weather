class WeatherFacade
  class << self
    def get_forecast(latlong)
      data = WeatherService.get_forecast(latlong)

      Forecast.new(data)
    end
  end
end
