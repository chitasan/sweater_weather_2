class HourlyWeathers < ApplicationRecord
  validates_presence_of :hourly_weather_info
  
  has_one :location
end