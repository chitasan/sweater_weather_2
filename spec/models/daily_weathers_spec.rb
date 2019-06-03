require 'rails_helper'

describe DailyWeathers, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:daily_weather_info) }
  end
  
  describe 'relationships' do
    it { should have_one(:location) }
  end
end