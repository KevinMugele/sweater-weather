require 'rails_helper'

RSpec.describe 'API::V1::Activities API' do
  describe 'GET /api/v1/forecast', :vcr do
    let(:destination) { 'Sparta, nj' }
    let(:result) { JSON.parse(response.body, symbolize_names: true) }

    it 'returns the forecase for the given destination' do
      get "/api/v1/activities?destination=#{destination}"

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

  it 'gives an error if param is empty' do
    get '/api/v1/activities?destination='

    expect(response).to_not be_successful
  end

  it 'gives an error if param is nil' do
    get '/api/v1/activities'

    expect(response).to_not be_successful
  end
end
