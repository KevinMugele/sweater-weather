require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:api_keys) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }
  end

  describe 'user creation' do
    subject(:user) { create(:user) }

    it 'automatically makes an api key' do
      expect(user.api_keys.size).to eq(1)
      expect(user.api_keys.first.token).to be_a(String)
    end
  end

  describe 'instance methods' do
    describe '#api_key' do
      subject(:user) { create(:user) }

      it 'returns the users api key (token)' do
        expect(user.api_key).to eq(user.api_keys.first.token)
      end
    end
  end
end
