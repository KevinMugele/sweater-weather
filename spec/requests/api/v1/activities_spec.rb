require 'rails_helper'

RSpec.describe 'API::V1::Activities API' do
  describe 'GET /api/v1/forecast', :vcr do
    let(:location) { 'Sparta, nj' }
    let(:result) { JSON.parse(response.body, symbolize_names: true) }

    it 'returns the forecase for the given location' do
      get "/api/v1/activities?destination=#{location}"

      expect(response).to be_successful

      expect(result).to be_a Hash
      expect(result[:data]).to be_a Hash
      expect(result[:data][:type]).to eq('activities')

      attributes = result[:data][:attributes]

      expect(attributes).to have_key(:activities)
      expect(attributes).to have_key(:destination)
      expect(attributes).to have_key(:forecast)
    end
  end
end
