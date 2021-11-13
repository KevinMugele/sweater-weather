class ForecastFacade
  class << self
    def get_coordinates(location)
      MapService.get_coordinates(location)
    end
  end
end
