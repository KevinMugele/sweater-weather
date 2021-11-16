class MapClient
  class << self
    def get_coordinates(location, url)
      response = conn.get(url) do |req|
        req.params['location'] = location
      end

      parse_data(response)
    end

    def get_directions(url, data_hash)
      response = conn.get(url) do |req|
        req.params['from'] = data_hash[:origin]
        req.params['to']   = data_hash[:destination]
      end

      parse_data(response)
    end

    private

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(
        url: 'http://www.mapquestapi.com',
        params: { key: ENV['mapquest_api_key'] },
        headers: { 'Content-Type' => 'application/json' }
      )
    end
  end
end
