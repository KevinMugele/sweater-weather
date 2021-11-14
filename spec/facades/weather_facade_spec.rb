require 'rails_helper'

RSpec.describe WeatherFacade, :vcr do
  let(:latlong) { {
    longitude: '-74.636612',
    latitude: '41.03608'
    } }

  it 'returns result from get_forecast' do
    result = WeatherFacade.get_forecast(latlong)

    expect(result).to be_an_instance_of(Forecast)
  end
end
