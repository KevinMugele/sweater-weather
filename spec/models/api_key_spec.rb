require 'rails_helper'

RSpec.describe ApiKey do
  describe 'relationships' do
    it { should belong_to(:user) }
  end

  describe 'class methods' do
    it 'returns the token' do
      first = create(:user).api_keys.first
      second = create(:user).api_keys.first

      expect(ApiKey.api_token).to eq(first.token)
      expect(ApiKey.api_token).not_to eq(second.token)

      expect(ApiKey.api_token).to be_a(String)
      expect(ApiKey.api_token.length).to eq(32)
    end
  end
end
