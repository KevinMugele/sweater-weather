require 'rails_helper'

RSpec.describe 'Activities Poro', :vcr do
  let(:destination) { 'Sparta, NJ' }
  let(:coordinates) { MapFacade.get_coordinates(destination) }
  let(:weather) { WeatherFacade.get_forecast(latitude: coordinates.latitude, longitude: coordinates.longitude) }
  let(:activities) { [ActivitiesService.get_activity('relaxation'), ActivitiesService.get_activity('recreational')] }
  let(:activity) { Activities.new(activities: activities, weather: weather, destination: destination) }

  it 'exists and has attributes' do
    expect(activity).to be_a Activities
    expect(activity.id).to eq(nil)

    expect(activity.activities).to be_an Array
    expect(activity.activities.first).to have_key(:title)
    expect(activity.activities.first).to have_key(:type)
    expect(activity.activities.first).to have_key(:price)
    expect(activity.activities.first).to have_key(:participants)

    expect(activity.destination).to eq(destination)

    expect(activity.forecast).to be_a Hash
    expect(activity.forecast).to have_key(:summary)
    expect(activity.forecast).to have_key(:temperature)
  end
end
