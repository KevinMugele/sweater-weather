require 'rails_helper'

RSpec.describe 'Forecast Poro', :vcr do
  let(:data) { WeatherService.get_forecast(latitude: 40.731506, longitude: -74.174385) }
  let(:forecast) { Forecast.new(data) }

  it 'exists and has attributes' do
    expect(forecast).to be_a Forecast
    expect(forecast.id).to eq(nil)

    expect(forecast.current_weather).to have_key(:datetime)
    expect(forecast.current_weather).to have_key(:sunrise)
    expect(forecast.current_weather).to have_key(:sunset)
    expect(forecast.current_weather).to have_key(:temperature)
    expect(forecast.current_weather).to have_key(:feels_like)
    expect(forecast.current_weather).to have_key(:humidity)
    expect(forecast.current_weather).to have_key(:uvi)
    expect(forecast.current_weather).to have_key(:visibility)
    expect(forecast.current_weather).to have_key(:conditions)
    expect(forecast.current_weather).to have_key(:icon)

    expect(forecast.daily_weather.first).to have_key(:date)
    expect(forecast.daily_weather.first).to have_key(:sunrise)
    expect(forecast.daily_weather.first).to have_key(:sunset)
    expect(forecast.daily_weather.first).to have_key(:max_temp)
    expect(forecast.daily_weather.first).to have_key(:min_temp)
    expect(forecast.daily_weather.first).to have_key(:conditions)
    expect(forecast.daily_weather.first).to have_key(:icon)

    expect(forecast.hourly_weather.first).to have_key(:time)
    expect(forecast.hourly_weather.first).to have_key(:temperature)
    expect(forecast.hourly_weather.first).to have_key(:conditions)
    expect(forecast.hourly_weather.first).to have_key(:icon)
  end
end
