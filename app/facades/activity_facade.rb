class ActivityFacade
  class << self
    def get_activity(destination)
      coordinates = MapFacade.get_coordinates(destination)
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

      Activities.new(activities: activities, weather: weather, destination: destination)
    end
  end
end
