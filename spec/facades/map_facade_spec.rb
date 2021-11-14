require 'rails_helper'

RSpec.describe MapFacade, :vcr do
  let(:location) { 'Sparta, NJ' }

  it 'returns result from get_coordinates' do
    result = MapFacade.get_coordinates(location)

    expect(result).to be_a Location
  end
end
