require 'rails_helper'

RSpec.describe WeatherClient, :vcr do
  let(:latlong) { {
    longitude: '-74.636612',
    latitude: '41.03608'
    } }

  it 'returns result from get forecast' do
    result = WeatherClient.get_forecast(latlong)

    expect(result).to be_a Hash
    expect(result).to have_key(:current)
    expect(result).to have_key(:hourly)
    expect(result).to have_key(:daily)
  end
end
