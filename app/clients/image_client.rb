class ImageClient
  class << self
    def get_background_image(location)
      response = conn.get('/photos/random') do |req|
        req.params['query'] = location
      end

      parse_data(response)
    end

    private

    def conn
      Faraday.new(
        url: 'https://api.unsplash.com',
        params: { client_id: ENV['unsplash_api_key'] },
        headers: {
          'Content-Type' => 'application/json',
          'Accept-Version' => 'v1'
        }
      )
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
