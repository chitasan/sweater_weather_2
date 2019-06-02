require 'rails_helper' 

describe Forecast, type: :model do
  describe 'instance methods' do 
    it '.forecast_weather' do
      forecast = Forecast.new('denver_co')

      expect(forecast.forecast_weather).to be_a(Hash)
    end 
  end 
end 