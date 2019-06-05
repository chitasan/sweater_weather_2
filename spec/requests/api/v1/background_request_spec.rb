require 'rails_helper' 

describe Background do
  it 'returns a background image for a location', :vcr do
    get "/api/v1/backgrounds?location=denver,co"

    expected = JSON.parse(response.body)

    expect(response).to be_successful
    expect(expected['data']['type']).to eq('background')
    expect(expected['data']['attributes']).to have_key('background_url')
  end 

  it 'returns a background image for another location', :vcr do 
    get "/api/v1/backgrounds?location=chicago,il"

    expected = JSON.parse(response.body)

    expect(response).to be_successful
    expect(expected['data']['type']).to eq('background')
    expect(expected['data']['attributes']).to have_key('background_url')
  end 
end 