class ActivitiesSerializer
  include JSONAPI::Serializer

  set_id :id
  attributes :activities, :destination, :forecast
end
