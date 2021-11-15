class ActivitiesService
  class << self
    def get_activity(type)
      ActivityClient.get_activity(type)
    end
  end
end
