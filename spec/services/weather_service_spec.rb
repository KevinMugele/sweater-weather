require 'rails_helper'

RSpec.describe WeatherService, :vcr do
  let(:latlong) { {
    longitude: -74.636612,
    latitude: 41.03608
    } }

  it 'returns result from get_forecast' do
    result = WeatherService.get_forecast(latlong)

    expect(result).to be_a(Hash)

    expect(result).to have_key(:lat)
    expect(result[:lat]).to eq(latlong[:latitude].round(4))

    expect(result).to have_key(:lon)
    expect(result[:lon]).to eq(latlong[:longitude].round(4))

    expect(result).to have_key(:current)
    expect(result[:current]).to be_a(Hash)

    expect(result[:current]).to have_key(:dt)
    expect(result[:current][:dt]).to be_an(Integer)

    expect(result[:current]).to have_key(:sunrise)
    expect(result[:current][:sunrise]).to be_an(Integer)

    expect(result[:current]).to have_key(:sunrise)
    expect(result[:current][:sunrise]).to be_an(Integer)

    expect(result[:current]).to have_key(:temp)
    expect(result[:current][:temp]).to be_a(Numeric) # Float

    expect(result[:current]).to have_key(:feels_like)
    expect(result[:current][:feels_like]).to be_a(Numeric) # Float

    expect(result[:current]).to have_key(:humidity)
    expect(result[:current][:humidity]).to be_an(Integer)

    expect(result[:current]).to have_key(:uvi)
    expect(result[:current][:uvi]).to be_a(Numeric) # Float

    expect(result[:current]).to have_key(:visibility)
    expect(result[:current][:visibility]).to be_an(Integer)

    expect(result[:current]).to have_key(:weather)
    expect(result[:current][:weather]).to be_an(Array)
    expect(result[:current][:weather].first).to be_a(Hash)

    expect(result[:current][:weather].first).to have_key(:description)
    expect(result[:current][:weather].first[:description]).to be_a(String)

    expect(result[:current][:weather].first).to have_key(:icon)
    expect(result[:current][:weather].first[:icon]).to be_a(String)

    expect(result).to have_key(:daily)
    expect(result[:daily]).to be_an(Array)
    expect(result[:daily].first).to be_a(Hash)

    expect(result[:daily].first).to have_key(:dt)
    expect(result[:daily].first[:dt]).to be_an(Integer)

    expect(result[:daily].first).to have_key(:sunrise)
    expect(result[:daily].first[:sunrise]).to be_an(Integer)

    expect(result[:daily].first).to have_key(:sunrise)
    expect(result[:daily].first[:sunrise]).to be_an(Integer)

    expect(result[:daily].first).to have_key(:temp)
    expect(result[:daily].first[:temp]).to be_a(Hash)

    expect(result[:daily].first[:temp]).to have_key(:max)
    expect(result[:daily].first[:temp][:max]).to be_a(Numeric) # Float

    expect(result[:daily].first[:temp]).to have_key(:min)
    expect(result[:daily].first[:temp][:min]).to be_a(Numeric) # Float

    expect(result[:daily].first[:weather].first).to have_key(:description)
    expect(result[:daily].first[:weather].first[:description]).to be_a(String)

    expect(result[:daily].first[:weather].first).to have_key(:icon)
    expect(result[:daily].first[:weather].first[:icon]).to be_a(String)

    expect(result).to have_key(:hourly)
    expect(result[:hourly]).to be_an(Array)
    expect(result[:hourly].first).to be_a(Hash)

    expect(result[:hourly].first).to have_key(:dt)
    expect(result[:hourly].first[:dt]).to be_an(Integer)

    expect(result[:hourly].first).to have_key(:temp)
    expect(result[:hourly].first[:temp]).to be_a(Numeric) # Float

    expect(result[:hourly].first[:weather].first).to have_key(:description)
    expect(result[:hourly].first[:weather].first[:description]).to be_a(String)

    expect(result[:hourly].first[:weather].first).to have_key(:icon)
    expect(result[:hourly].first[:weather].first[:icon]).to be_a(String)
  end
end
