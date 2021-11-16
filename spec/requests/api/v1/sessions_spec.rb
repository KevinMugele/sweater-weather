require 'rails_helper'

describe 'Api::V1::Sessions API', type: :request do
  describe 'POST /api/v1/sessions' do
    let!(:user) { create(:user, email: email, password: password) }
    let(:email) { 'whatever@example.com' }
    let(:password) { 'password' }
    let(:result) { JSON.parse(response.body, symbolize_names: true) }

    context 'with valid params' do
      let(:valid_params) { { email: email, password: password } }

      before { post '/api/v1/sessions', params: valid_params }

      it 'sends the params in the body (not as query params)' do
        expect(request.fullpath).to eq('/api/v1/sessions')
      end

      it "returns the user's email and api key" do
        expect(result[:data][:type]).to eq('user')
        expect(result[:data][:id]).to be_a(String)
        expect(result[:data][:attributes][:email]).to eq(email)
        expect(result[:data][:attributes][:api_key]).to eq(user.api_key)
      end
    end

    context 'invalid params' do
      context 'invalid password' do
        let(:invalid_params) { { email: email, password: '12hu83' } }

        before { post '/api/v1/sessions', params: invalid_params }

        it 'returns an error message' do
          expect(result.size).to eq(1)
          expect(result[:message]).to eq('You have entered an invalid email or password')
        end
      end

      context 'missing email' do
        let(:invalid_params) { { password: password } }

        before { post '/api/v1/sessions', params: invalid_params }

        it 'returns an error message' do
          expect(result.size).to eq(1)
          expect(result[:message]).to eq('You have entered an invalid email or password')
        end
      end

      context 'missing password' do
        let(:invalid_params) { { email: email } }

        before { post '/api/v1/sessions', params: invalid_params }

        it 'returns an error message' do
          expect(result.size).to eq(1)
          expect(result[:message]).to eq('You have entered an invalid email or password')
        end
      end

      context 'when the params are missing' do
        let(:invalid_params) { {} }

        before { post '/api/v1/sessions', params: invalid_params }

        it 'returns an error message' do
          expect(result.size).to eq(1)
          expect(result[:message]).to eq('You have entered an invalid email or password')
        end
      end
    end
  end
end
