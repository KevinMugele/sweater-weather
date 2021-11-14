class MapService
  class << self
    def get_coordinates(location)
      url = '/geocoding/v1/address'
      MapClient.get_coordinates(location, url)
    end
  end
end
