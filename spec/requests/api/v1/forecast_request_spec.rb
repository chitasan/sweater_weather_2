require 'rails_helper'

describe Forecast do
  it 'can return weather forecast for city with daily and hour info', :vcr do 
    get "/api/v1/forecast?location=denver,co"

    expected = JSON.parse(response.body)

    expect(response).to be_successful
    expect(expected['data']['type']).to eq('forecasts')
    expect(expected['data']['attributes']['city']).to eq('Denver')
    expect(expected['data']['attributes']).to have_key('current_weather')
    expect(expected['data']['attributes']).to have_key('weather_hours')
    expect(expected['data']['attributes']['weather_hours'].count).to eq(8)
    expect(expected['data']['attributes']).to have_key('weather_days')
    expect(expected['data']['attributes']['weather_days'].count).to eq(5)
  end

  it 'can return weather forecast for another city with daily and hour info', :vcr do
    get "/api/v1/forecast?location=chicago,il"
  
    expected = JSON.parse(response.body)

    expect(response).to be_successful
    expect(expected['data']['type']).to eq('forecasts')
    expect(expected['data']['attributes']['city']).to eq('Chicago')
    expect(expected['data']['attributes']).to have_key('current_weather')
    expect(expected['data']['attributes']).to have_key('weather_hours')
    expect(expected['data']['attributes']['weather_hours'].count).to eq(8)
    expect(expected['data']['attributes']).to have_key('weather_days')
    expect(expected['data']['attributes']['weather_days'].count).to eq(5)
  end 
end