require 'rails_helper'

RSpec.describe MapService, :vcr do
  let(:location) { 'Sparta, NJ' }

  it 'returns result from get_coordinates' do
    result = MapService.get_coordinates(location)

    expect(result).to be_a Hash
    expect(result[:results].first[:locations].first[:displayLatLng][:lat]).to eq(41.03608)
    expect(result[:results].first[:locations].first[:displayLatLng][:lng]).to eq(-74.636612)
  end
end
