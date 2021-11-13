class WeatherService
  class << self
    def get_forecast(longitude, latitude)
      url = ''
      WeatherClient.fetch(url)
    end
  end
end
