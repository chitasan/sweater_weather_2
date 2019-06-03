require 'rails_helper'

describe Location, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
  end
  
  describe 'relationships' do
    it { should belong_to(:current_weather) }
    it { should belong_to(:hourly_weathers) }
    it { should belong_to(:daily_weathers) }
  end
end