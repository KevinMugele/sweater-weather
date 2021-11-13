require 'rails_helper'

RSpec.describe 'API::V1::Forecast API' do
  describe 'GET /api/v1/forecast', :vcr do
    let(:location) { 'sparta, nj' }

    it 'returns the forecase for the given location' do
    end
  end
end
