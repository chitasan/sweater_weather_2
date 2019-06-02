require 'rails_helper'

describe Forecast do
  it 'can return weather forecast for city' do 
    get "/api/v1/forecast?location=denver,co"

    expected = JSON.parse(response.body)

    expect(response).to be_successful
    expect(expected['data']['id']).to eq('1')
    expect(expected['data']['type']).to eq('forecast')
    expect(expected['data']['attributes']['forecast_weather']['timezone']).to eq('America/Denver')
  end

  it 'can return weather forecast for another city' do
    get "/api/v1/forecast?location=chicago,il"
  
    expected = JSON.parse(response.body)

    expect(response).to be_successful
  
    expect(expected['data']['id']).to eq('1')
    expect(expected['data']['type']).to eq('forecast')
    expect(expected['data']['attributes']['forecast_weather']['timezone']).to eq('America/Chicago')
  end 
end