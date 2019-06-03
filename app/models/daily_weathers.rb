class DailyWeathers < ApplicationRecord
  validates_presence_of :daily_weather_info

  has_one :location
end