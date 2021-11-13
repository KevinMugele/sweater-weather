class WeatherFacade
  class << self
    def get_forecast(longitude, latitude)
      WeatherService.get_forecast(longitude, latitude)
    end
  end
end
