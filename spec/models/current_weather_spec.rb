require 'rails_helper' 

describe CurrentWeather, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:temperature) }
    it { should validate_presence_of(:feels_like) }
    it { should validate_presence_of(:temp_high) }
    it { should validate_presence_of(:temp_low) }
    it { should validate_presence_of(:humidity) }
    it { should validate_presence_of(:visibility) }
    it { should validate_presence_of(:uv_index) }
    it { should validate_presence_of(:current_summary) }
    it { should validate_presence_of(:icon) }
    it { should validate_presence_of(:today_summary) }
  end 

  describe 'relationships' do
    it { should have_one(:location) }
  end 
end 