require 'rails_helper'

describe 'Api::V1::Users API', type: :request do
  describe 'POST /api/v1/users' do
    let(:email) { 'whatever@example.com' }
    let(:password) { 'password' }
    let(:result) { JSON.parse(response.body, symbolize_names: true) }

    context 'with valid params' do
      let(:valid_params) do
        {
          email: email,
          password: password,
          password_confirmation: password
        }
      end

      before { post '/api/v1/users', params: valid_params }

      it 'sends the params in the body (not as query params)' do
        expect(request.fullpath).to eq('/api/v1/users')
      end

      it "returns the user's email and api key" do
        expect(result[:data][:type]).to eq('user')
        expect(result[:data][:id]).to be_a(String)
        expect(result[:data][:attributes][:email]).to eq(email)
        expect(result[:data][:attributes][:api_key]).to eq(User.last.api_key)
      end
    end

    context 'with invalid params' do
      context 'when the passwords do not match' do
        let(:invalid_params) do
          {
            email: email,
            password: '123sqd',
            password_confirmation: password
          }
        end

        before { post '/api/v1/users', params: invalid_params }

        it 'returns an error message' do
          expect(result[:errors].size).to eq(1)
          expect(result[:errors].first[:detail]).to eq("Your record could not be saved: Password confirmation doesn't match Password")
        end
      end

      context 'missing password confirmation' do
        let(:invalid_params) do
          {
            email: email,
            password: password
          }
        end

        before { post '/api/v1/users', params: invalid_params }

        it 'returns an error message' do
          expect(result[:errors].size).to eq(1)
          expect(result[:errors].first[:detail]).to eq("Your record could not be saved: Password confirmation can't be blank")
        end
      end

      context 'missing email' do
        let(:invalid_params) do
          {
            password: password,
            password_confirmation: password
          }
        end

        before { post '/api/v1/users', params: invalid_params }

        it 'returns an error message' do
          expect(result[:errors].size).to eq(1)
          expect(result[:errors].first[:detail]).to eq("Your record could not be saved: Email can't be blank")
        end
      end

      context 'missing password' do
        let(:invalid_params) do
          {
            email: email,
            password_confirmation: password
          }
        end

        before { post '/api/v1/users', params: invalid_params }

        it 'returns an error message' do
          expect(result[:errors].size).to eq(1)
          expect(result[:errors].first[:detail]).to eq("Your record could not be saved: Password can't be blank")
        end
      end

      context 'the email is being used' do
        let!(:registered_user) { create(:user, email: email) }
        let(:invalid_params) do
          {
            email: email,
            password: password,
            password_confirmation: password
          }
        end

        before { post '/api/v1/users', params: invalid_params }

        it 'returns an error message' do
          expect(result[:errors].size).to eq(1)
          expect(result[:errors].first[:detail]).to eq('Your record could not be saved: Email has already been taken')
        end
      end
    end
  end
end
