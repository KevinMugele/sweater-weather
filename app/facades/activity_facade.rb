class ActivityFacade
  class << self
    def get_activity(location)
      coordinates = MapFacade.get_coordinates(location)
      weather = WeatherFacade.get_forecast(latitude: coordinates.latitude, longitude: coordinates.longitude)

      activities = []

      activities << ActivitiesService.get_activity('relaxation')

      if weather.current_weather[:temperature] >= 60
        activities << ActivitiesService.get_activity('recreational')
      elsif weather.current_weather[:temperature] >= 50 && weather.current_weather[:temperature] < 60
        activities << ActivitiesService.get_activity('busywork')
      else
        activities << ActivitiesService.get_activity('cooking')
      end

      Activities.new(activities: activities, weather: weather, destination: location)
    end
  end
end
