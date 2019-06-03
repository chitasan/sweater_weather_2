require 'rails_helper'

describe Weather, type: :model do
  it 'exists' do
    weather = Weather.new("39.7392358", "-104.990251")

    expect(weather).to be_a(Weather)
    expect(weather.latitude).to eq("39.7392358")
    expect(weather.longitude).to eq("-104.990251")
  end

  describe 'instance methods' do
    it '.weather_days' do
      weather = Weather.new("39.7392358", "-104.990251")
      
      expect(weather.weather_days(5)).to be_a(Array)
    end

    it '.weather_hours' do
      weather = Weather.new("39.7392358", "-104.990251")
      
      expect(weather.weather_hours(8)).to be_a(Array)
    end

    it '.current_weather' do
      weather = Weather.new("39.7392358", "-104.990251")
      
      expect(weather.current_weather).to be_a(Hash)
      expect(weather.current_weather).to have_key(:temperature)
      expect(weather.current_weather).to have_key(:feels_like)
      expect(weather.current_weather).to have_key(:temp_high)
      expect(weather.current_weather).to have_key(:temp_low)
      expect(weather.current_weather).to have_key(:humidity)
      expect(weather.current_weather).to have_key(:visibility)
      expect(weather.current_weather).to have_key(:uv_index)
      expect(weather.current_weather).to have_key(:today_summary)
      expect(weather.current_weather).to have_key(:current_summary)
      expect(weather.current_weather).to have_key(:icon)
    end 
  end 
end 