require 'rails_helper' 

describe Forecast, type: :model do
  it 'exists' do
    forecast = Forecast.new('denver,co')

    expect(forecast).to be_a(Forecast)
    expect(forecast.city).to eq('Denver')
    expect(forecast.state).to eq('CO')
  end 

  describe 'instance methods' do 
    it '.get_current_weather' do
      forecast = Forecast.new('denver,co')

      current_weather = JSON.parse(forecast.get_current_weather.to_json, symbolize_names: true)

      expect(current_weather).to be_a(Hash)
      expect(current_weather).to have_key(:temperature)
      expect(current_weather).to have_key(:feels_like)
      expect(current_weather).to have_key(:temp_high)
      expect(current_weather).to have_key(:temp_low)
      expect(current_weather).to have_key(:humidity)
      expect(current_weather).to have_key(:visibility)
      expect(current_weather).to have_key(:uv_index)
      expect(current_weather).to have_key(:current_summary)
      expect(current_weather).to have_key(:today_summary)
      expect(current_weather).to have_key(:icon)
    end

    it '.get_weather_days' do
      forecast = Forecast.new('denver,co')
      
      weather_days = JSON.parse(forecast.get_weather_days.to_json, symbolize_names: true)
      
      expect(weather_days).to be_a(Array)
      expect(weather_days[0]).to have_key(:date)
      expect(weather_days[0]).to have_key(:icon)
      expect(weather_days[0]).to have_key(:summary)
      expect(weather_days[0]).to have_key(:precip_probability)
      expect(weather_days[0]).to have_key(:precip_type)
      expect(weather_days[0]).to have_key(:temp_high)
      expect(weather_days[0]).to have_key(:temp_low)
    end 

    it '.get_weather_hours' do
      forecast = Forecast.new('denver,co')
      
      weather_hours = JSON.parse(forecast.get_weather_hours.to_json, symbolize_names: true)
      
      expect(weather_hours).to be_a(Array)
      expect(weather_hours[0]).to have_key(:time)
      expect(weather_hours[0]).to have_key(:temperature)
      expect(weather_hours[0]).to have_key(:icon)
    end 
  end 
end 