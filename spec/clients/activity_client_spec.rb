require 'rails_helper'

RSpec.describe ActivityClient, :vcr do
  let(:type) { 'recreational' }

  it 'returns result from get activity' do
    result = ActivityClient.get_activity(type)

    expect(result).to be_a Hash
    expect(result.size).to eq(7)
    expect(result).to have_key(:activity)
  end
end
