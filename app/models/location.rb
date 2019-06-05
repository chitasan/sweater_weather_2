class Location < ApplicationRecord
  validates_presence_of :city,
                        :state,
                        :latitude,
                        :longitude
  
  belongs_to :current_weather
  belongs_to :hourly_weathers
  belongs_to :daily_weathers
  belongs_to :favorites
end