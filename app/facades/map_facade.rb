class MapFacade
  class << self
    def get_coordinates(location)
      data = MapService.get_coordinates(location)

      Location.new(data)
    end
  end
end
