class Forecast
  attr_reader :city,
              :state,
              :date,
              :latitude,
              :longitude

  DaysAhead  = 5
  HoursAhead = 8
  
  def initialize(city_state)
    split_location = city_state.split(',')
    @city          = split_location[0].capitalize
    @state         = split_location[1].upcase
    @latitude      = get_latitude
    @longitude     = get_longitude
    @date          = get_date
    @location      = location
  end
  
  def get_current_weather
    @location.current_weather
  end
  
  def get_weather_hours
    JSON.parse(@location.hourly_weathers.hourly_weather_info, symbolize_names: true)
  end
  
  def get_weather_days
    JSON.parse(@location.daily_weathers.daily_weather_info, symbolize_names: true)
  end
  
  def location_id
    @location.id
  end
  
  private
  
  def location
    Location.find_or_create_by(city: city, state: state) do |location|
      location.latitude = get_latitude
      location.longitude = get_longitude
      location.current_weather = CurrentWeather.create(weather.current_weather)
      location.hourly_weathers = HourlyWeathers.create(hourly_weather_info: weather.weather_hours(HoursAhead).to_json)
      location.daily_weathers = DailyWeathers.create(daily_weather_info: 
      weather.weather_days(DaysAhead).to_json)
    end
  end
  
  def get_latitude
    @latitude ||= location_service.get_latitude
  end
  
  def get_longitude
    @longitude ||= location_service.get_longitude
  end
  
  def weather
    @weather ||= Weather.new(latitude, longitude)
  end
  
  def get_date
    Time.now.strftime('%Y-%m-%d')
  end
  
  def location_service
    @location_service ||= LocationService.new(city, state)
  end
end