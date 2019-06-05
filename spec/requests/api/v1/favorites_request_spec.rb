require 'rails_helper'

describe 'Favorites' do
  it 'returns 401 with no API key' do
    post '/api/v1/favorites', params: { location: 'Denver, CO' }
    
    expect(response.status).to eq(401)
    expect(response.body).to eq('{}')
  end

  it 'returns 401 with incorrect API key' do
    user = User.create(email: 'email', password: 'password')
    
    post '/api/v1/favorites', params: {
                                        location: 'Denver, CO',
                                        api_key: 'bad bad api key'
                                      }
    
    expect(response.status).to eq(401)
    expect(response.body).to eq('{}')
  end

  it 'creates a favorite', :vcr do
    user = User.create(email: 'email', password: 'password')
    location = Location.create(city: "Denver", state: "CO", latitude: "39.7392358", longitude: "-105.109927")
    
    post '/api/v1/favorites', params: {
      location: location.id,
      api_key: user.api_key
    }
    expect(response).to be_successful
    favorite = Favorite.last
    expect(favorite.location).to eq(location)
    expect(favorite.user).to eq(user)
  end
  
  it 'returns a list of favorite locations; empty if no favorites' do
    user = User.create(email: 'email', password: 'password')
    get '/api/v1/favorites', params: { api_key: user.api_key }
    
    expect(response.status).to eq(200)
    favorites = JSON.parse(response.body, symbolize_names: true)
    expect(favorites[:data]).to be_empty
  end
  
  it 'returns list of favorite locations', :vcr do
    user = User.create(email: 'email', password: 'password')
    location = Location.create(city: "Denver", state: "CO", latitude: "39.7392358", longitude: "-105.109927")
    user.favorites.create(location: location)
    current_weather = CurrentWeather.create(location: location, 
                                            temperature: "72.68",
                                            feels_like: "72.68",
                                            temp_high: "80.52",
                                            temp_low: "53.47",
                                            humidity: "0.33",
                                            visibility: "5.35",
                                            uv_index: "0",
                                            current_summary: "Partly Cloudy",
                                            icon: "partly-cloudy-night",
                                            today_summary: "Mostly cloudy throughout the day."
                                          )
    
    get '/api/v1/favorites', params: { api_key: user.api_key }
    
    expect(response.status).to eq(200)
    favorites = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(favorites).to be_a(Array)
    expect(favorites.first).to be_a(Hash)
    expect(favorites.first[:attributes]).to have_key(:city)
    expect(favorites.first[:attributes]).to have_key(:state)
    expect(favorites.first[:attributes][:city]).to eq(location.city)
    expect(favorites.first[:attributes][:state]).to eq(location.state)
    expect(favorites.first[:attributes]).to have_key(:current_weather)
    expect(favorites.first[:attributes][:current_weather]).to have_key(:temperature)
    expect(favorites.first[:attributes][:current_weather]).to have_key(:feels_like)
    expect(favorites.first[:attributes][:current_weather]).to have_key(:temp_high)
    expect(favorites.first[:attributes][:current_weather]).to have_key(:temp_low)
    expect(favorites.first[:attributes][:current_weather]).to have_key(:humidity)
    expect(favorites.first[:attributes][:current_weather]).to have_key(:visibility)
    expect(favorites.first[:attributes][:current_weather]).to have_key(:uv_index)
    expect(favorites.first[:attributes][:current_weather]).to have_key(:current_summary)
    expect(favorites.first[:attributes][:current_weather]).to have_key(:today_summary)
    expect(favorites.first[:attributes][:current_weather]).to have_key(:icon)
  end
end