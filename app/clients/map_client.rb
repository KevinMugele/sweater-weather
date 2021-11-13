class MapClient
  class << self
    def fetch(url)
      parse_data(Faraday.get(url))
    end

    private

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
