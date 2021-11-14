require 'rails_helper'

RSpec.describe ImageFacade, :vcr do
  let(:location) { 'Sparta, NJ' }

  it 'returns result from get_forecast' do
    result = ImageFacade.get_image(location)

    expect(result).to be_an_instance_of(Image)
  end
end
