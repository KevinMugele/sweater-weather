require 'rails_helper'

RSpec.describe MapClient, :vcr do
  let(:location) { 'Sparta, NJ' }
  let(:url) { '/geocoding/v1/address' }

  it 'returns result from get coordinates' do
    result = MapClient.get_coordinates(location, url)

    expect(result).to be_a Hash
    expect(result[:results].first[:providedLocation][:location]).to eq(location)
    expect(result[:results].first[:locations].first[:displayLatLng]).to be_a Hash
  end
end
