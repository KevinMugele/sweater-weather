require 'rails_helper'

RSpec.describe RoadTripFacade, :vcr do
  let(:params) do
    {
      origin: 'Sparta, NJ',
      destination: 'Miami, Fl'
    }
  end

  it 'returns result from get_coordinates' do
    result = RoadTripFacade.get_road_trip(params)

    expect(result).to be_a RoadTrip
  end
end
