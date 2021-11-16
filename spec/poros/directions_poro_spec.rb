require 'rails_helper'

RSpec.describe 'Directions Poro', :vcr do
  it 'exists and has attributes with a short distance' do
    data = MapService.get_directions(destination: 'Newark, NJ', origin: 'Sparta, NJ')
    directions = Directions.new(data)

    expect(directions).to be_a Directions
    expect(directions.id).to eq(nil)

    expect(directions.start_city).to eq('Sparta, NJ')
    expect(directions.end_city).to eq('Newark, NJ')
    expect(directions.end_latitude).to eq(40.731506)
    expect(directions.end_longitude).to eq(-74.174385)
    expect(directions.travel_time).to eq('52 minutes')
    expect(directions.travel_time_seconds).to eq(3139)
  end

  it 'exists and has attributes with a long distance' do
    data = MapService.get_directions(destination: 'Newark, NJ', origin: 'Nashville, TN')
    directions = Directions.new(data)

    expect(directions).to be_a Directions
    expect(directions.id).to eq(nil)

    expect(directions.start_city).to eq('Nashville, TN')
    expect(directions.end_city).to eq('Newark, NJ')
    expect(directions.travel_time).to eq('2777 hours, 46 minutes')
    expect(directions.travel_time_seconds).to eq(10_000_000)
  end

  it 'exists and has attributes with a medium distance' do
    data = MapService.get_directions(destination: 'Newark, NJ', origin: 'High Point, NJ')
    directions = Directions.new(data)

    expect(directions).to be_a Directions
    expect(directions.id).to eq(nil)

    expect(directions.start_city).to eq('High Point, NJ')
    expect(directions.end_city).to eq('Newark, NJ')
    expect(directions.travel_time).to eq('1 hour, 17 minutes')
    expect(directions.travel_time_seconds).to eq(4646)
  end

  it 'calculates travel time' do
    data = MapService.get_directions(destination: 'Newark, NJ', origin: 'High Point, NJ')
    directions = Directions.new(data)

    expect(directions.calculated_travel_time(4596)).to eq('1 hour, 16 minutes')
    expect(directions.calculated_travel_time(300)).to eq('5 minutes')
    expect(directions.calculated_travel_time(10_000)).to eq('2 hours, 46 minutes')
  end
end
