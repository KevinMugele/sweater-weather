require 'rails_helper'

RSpec.describe ImageService, :vcr do
  let(:location) { 'Sparta, NJ' }

  it 'returns result from get_coordinates' do
    result = ImageService.get_image(location)

    expect(result).to be_a Hash
  end
end
