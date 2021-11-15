require 'rails_helper'

RSpec.describe ActivitiesService, :vcr do
  let(:type) { 'recreational' }

  it 'returns result from get activity' do
    result = ActivitiesService.get_activity(type)

    expect(result).to be_a Hash
    expect(result.size).to eq(7)
  end
end
