require 'rails_helper'

describe HourlyWeathers, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:hourly_weather_info) }
  end
  
  describe 'relationships' do
    it { should have_one(:location) }
  end
end