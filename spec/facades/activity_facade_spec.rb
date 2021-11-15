require 'rails_helper'

RSpec.describe ActivityFacade, :vcr do
  let(:destination) { 'Sparta, NJ' }

  it 'return results from get_activity' do
    result = ActivityFacade.get_activity(destination)

    expect(result).to be_a Activities
    expect(result.activities.size).to eq 2
  end
end
