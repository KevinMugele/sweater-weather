require 'rails_helper'

RSpec.describe 'API::V1::Forecast API' do
  describe 'GET /api/v1/forecast', :vcr do
    let(:location) { 'sparta, nj' }
    let(:result) { JSON.parse(response.body, symbolize_names: true) }

    it 'returns the forecase for the given location' do
      get "/api/v1/forecast?location=#{location}"

      expect(response).to be_successful
      expect(result).to be_a Hash
      expect(result[:data]).to be_a Hash
      expect(result[:data][:attributes][:current_weather].size).to eq(10)
      expect(result[:data][:attributes][:daily_weather].size).to eq(8)
      expect(result[:data][:attributes][:daily_weather].first.size).to eq(7)
      expect(result[:data][:attributes][:hourly_weather].size).to eq(48)
      expect(result[:data][:attributes][:hourly_weather].first.size).to eq(4)
    end
  end
end
