class WeatherService
  class << self
    def get_forecast(latlong)
      WeatherClient.get_forecast(latlong)
    end
  end
end
