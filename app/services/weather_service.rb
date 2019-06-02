class WeatherService
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end
  
  def get_weather
    response = darksky_conn.get("forecast/#{ENV['DARKSKY_API_KEY']}/#{@latitude},#{@longitude}") 
    JSON.parse(response.body, symbolize_names: true) 
  end 

  private

  def darksky_conn
    Faraday.new("https://api.darksky.net/") do |faraday|
      faraday.params['exclude']= 'minutely,flags'
      faraday.adapter Faraday.default_adapter
    end
  end 
end 