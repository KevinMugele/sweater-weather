class MapService
  class << self
    def get_coordinates(location)
      url = '/geocoding/v1/address'
      MapClient.get_coordinates(location, url)
    end

    def get_directions(data_hash)
      url = '/directions/v2/route'
      MapClient.get_directions(url, data_hash)
    end
  end
end
