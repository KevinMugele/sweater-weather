class WeatherClient
  class << self
    def get_forecast(exclude: 'minutely,alerts', units: 'imperial',
                      **arguments)
      response = conn.get('/data/2.5/onecall') do |req|
        req.params['lat']     = arguments[:latitude]
        req.params['lon']     = arguments[:longitude]
        req.params['exclude'] = arguments[:exclude] || exclude
        req.params['units']   = arguments[:units] || units
      end

      parse_data(response)
    end

    private

    def conn
      Faraday.new(
        url: 'https://api.openweathermap.org',
        params: { appid: ENV['open_weather_api_key'] },
        headers: { 'Content-Type' => 'application/json' }
      )
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
