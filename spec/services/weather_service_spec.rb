require 'rails_helper'

describe 'WeatherService' do
  it 'exists' do
    service = WeatherService.new("latitude", "longitude")

    expect(service).to be_a(WeatherService)
  end

  # describe 'instance methods' do
  #   it '.get_weather' do
  #     service = WeatherService.new("Denver", "CO")
 
  #     
  #   end
  # end 
end 