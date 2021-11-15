require 'rails_helper'

RSpec.describe 'API::V1::Backgrounds API' do
  describe 'GET /api/v1/forecast', :vcr do
    let(:location) { 'Sparta, nj' }
    let(:result) { JSON.parse(response.body, symbolize_names: true) }

    it 'returns the forecase for the given location' do
      get "/api/v1/backgrounds?location=#{location}"

      expect(response).to be_successful
      expect(result).to be_a Hash
      expect(result[:data]).to be_a Hash

      attributes = result[:data][:attributes][:image]

      expect(attributes).to have_key(:location)
      expect(attributes).to have_key(:image_url)
      expect(attributes).to have_key(:credit)
    end
  end
end
