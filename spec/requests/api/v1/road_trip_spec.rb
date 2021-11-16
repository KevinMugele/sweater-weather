require 'rails_helper'

describe 'Api::V1::RoadTrips API', type: :request do
  describe 'POST /api/v1/road_trip', :vcr do
    context 'when I provide a valid API key' do
      context 'when I provide road trip params' do
        let!(:user) { create(:user) }
        let(:api_key) { user.api_key }
        let(:result) { JSON.parse(response.body, symbolize_names: true) }
        let(:road_trip_params) do
          {
            origin: 'Sparta, NJ',
            destination: 'Newark, NJ',
            api_key: api_key
          }
        end

        before { post '/api/v1/road_trip', params: road_trip_params }

        it 'returns the road trip details' do
          expect(result[:data][:id]).to be_nil
          expect(result[:data][:type]).to eq('roadtrip')
          expect(result[:data][:attributes].size).to eq(4)
          expect(result[:data][:attributes][:start_city]).to eq('Sparta, NJ')
          expect(result[:data][:attributes][:end_city]).to eq('Newark, NJ')
          expect(result[:data][:attributes][:travel_time]).to be_a(String)
          expect(result[:data][:attributes][:weather_at_eta]).to be_a(Hash)
          expect(result[:data][:attributes][:weather_at_eta].size).to eq(2)
          expect(result[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Numeric)
          expect(result[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
        end
      end
    end
  end
end
