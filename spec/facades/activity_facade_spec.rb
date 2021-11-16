require 'rails_helper'

RSpec.describe ActivityFacade, :vcr do
  it 'return results from get_activity' do
    result = ActivityFacade.get_activity('Sparta, NJ')

    expect(result).to be_a Activities
    expect(result.activities.size).to eq 2
  end

  it 'return results from get_activity' do
    result = ActivityFacade.get_activity('Miami, FL')

    expect(result).to be_a Activities
    expect(result.activities.size).to eq 2
  end

  it 'return results from get_activity' do
    result = ActivityFacade.get_activity('San Francisco, CA')

    expect(result).to be_a Activities
    expect(result.activities.size).to eq 2
  end
end
