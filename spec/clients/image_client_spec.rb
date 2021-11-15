require 'rails_helper'

RSpec.describe ImageClient, :vcr do
  let(:location) { 'Sparta, NJ' }

  it 'returns result from get coordinates' do
    result = ImageClient.get_background_image(location)

    expect(result).to be_a Hash
    expect(result).to have_key(:urls)
  end
end
