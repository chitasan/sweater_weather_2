class Forecast
  attr_reader :city, :state, :id

  def initialize(city_state)
    location = city_state.split(',')
    @city = location[0]
    @state = location[1]
    @id = 1
  end

  def forecast_weather
    @latitude ||= location_service.get_longitude
    @longitude ||= location_service.get_latitude
    weather_service.get_weather
  end

  private

  def location_service
    @location_service ||= LocationService.new(@city, @state)
  end

  def weather_service
    @weather_service ||= WeatherService.new(latitude, longitude)
  end 
end 