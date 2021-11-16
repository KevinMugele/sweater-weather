class Directions
  attr_reader :id, :start_city, :end_city, :end_latitude, :end_longitude,
              :travel_time, :travel_time_seconds

  def initialize(data)
    @id = nil
    @start_city = origin(data[:route][:locations].first[:adminArea5],
                         data[:route][:locations].first[:adminArea3])
    @end_city = destination(data[:route][:locations].last[:adminArea5],
                            data[:route][:locations].last[:adminArea3])
    @end_latitude = data[:route][:locations].last[:displayLatLng][:lat]
    @end_longitude = data[:route][:locations].last[:displayLatLng][:lng]
    @travel_time = estimated_travel_time(data[:route][:realTime])
    @travel_time_seconds = data[:route][:realTime]
  end

  def origin(city, state)
    "#{city}, #{state}"
  end

  def destination(city, state)
    "#{city}, #{state}"
  end

  def estimated_travel_time(travel_time_seconds)
    hours = travel_time_seconds / 3600
    minutes = travel_time_seconds / 60 % 60

    if hours.zero?
      "#{minutes} minutes"
    elsif hours == 1
      "#{hours} hour, #{minutes} minutes"
    else
      "#{hours} hours, #{minutes} minutes"
    end
  end

  def calculated_travel_time(travel_time_seconds)
    hours = travel_time_seconds / 3600
    minutes = travel_time_seconds / 60 % 60

    if hours.zero?
      "#{minutes} minutes"
    elsif hours == 1
      "#{hours} hour, #{minutes} minutes"
    else
      "#{hours} hours, #{minutes} minutes"
    end
  end
end
