require 'rails_helper'

RSpec.describe 'API::V1::Activities API' do
  describe 'GET /api/v1/forecast', :vcr do
    let(:location) { 'Sparta, nj' }
    let(:result) { JSON.parse(response.body, symbolize_names: true) }

    it 'returns the forecase for the given location' do
      get "/api/v1/activities?destination=#{location}"

      expect(response).to be_successful
    end
  end
end
