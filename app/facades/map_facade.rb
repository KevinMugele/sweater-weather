class MapFacade
  class << self
    def get_coordinates(location)
      data = MapService.get_coordinates(location)

      Location.new(data)
    end

    def get_directions(data_hash)
      data = MapService.get_directions(data_hash)
      return nil unless data[:info][:statuscode].zero?

      Directions.new(data)
    end
  end
end
