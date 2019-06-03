class CurrentWeather < ApplicationRecord
  validates_presence_of :temperature,
                        :feels_like,
                        :temp_high,
                        :temp_low,
                        :humidity,
                        :visibility,
                        :uv_index,
                        :current_summary,
                        :icon,
                        :today_summary

  has_one :location
end 