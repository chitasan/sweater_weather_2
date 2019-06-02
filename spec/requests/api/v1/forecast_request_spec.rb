require 'rails_helper'

describe Forecast do
  it 'can return forecast weather for location' do 
    get "/api/v1/forecast?location=denver,co"

    expected = JSON.parse(response.body)

    expect(response).to be_successful
    expect(expected['data']['id']).to eq('1')
    expect(expected['data']['type']).to eq('forecast')
  end
end