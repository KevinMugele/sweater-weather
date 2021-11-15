require 'rails_helper'

RSpec.describe ForecastFacade, :vcr do
  let(:location) { 'Sparta, NJ' }

  it 'returns result from get_forecast' do
    result = ForecastFacade.get_forecast(location)

    expect(result).to be_an_instance_of(Forecast)
  end
end
