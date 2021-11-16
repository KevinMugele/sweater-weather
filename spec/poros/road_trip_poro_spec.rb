require 'rails_helper'

RSpec.describe 'RoadTrip Poro', :vcr do
  it 'exists and has no forecast' do
    directions = MapFacade.get_directions(destination: 'London, UK', origin: 'Mexico City, Mexico')
    trip = RoadTrip.new(destination: 'London, UK', origin: 'Mexico City, Mexico')

    expect(trip).to be_a RoadTrip
    expect(trip.id).to eq(nil)
    expect(trip.end_city).to eq('London,  UK')
    expect(trip.start_city).to eq('Mexico City,  Mexico')
    expect(trip.travel_time).to eq('impossible')
  end

  it 'exists and has no forecast' do
    directions = MapFacade.get_directions(destination: 'Sparta, NJ', origin: 'Newark, NJ')
    forecast = WeatherFacade.get_forecast(latitude: directions.end_latitude, longitude: directions.end_longitude)
    trip = RoadTrip.new(directions, forecast)

    expect(trip).to be_a RoadTrip
    expect(trip.id).to eq(nil)
    expect(trip.end_city).to eq('Sparta, NJ')
    expect(trip.start_city).to eq('Newark, NJ')
    expect(trip.travel_time).to eq('50 minutes')

    expect(trip.weather_at_eta).to have_key(:conditions)
    expect(trip.weather_at_eta).to have_key(:temperature)
  end
end
