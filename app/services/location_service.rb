class LocationService
  def initialize(city, state)
    @city = city
    @state = state
  end
  
  def get_longitude
    get_location[:lng].to_s
  end 
  
  def get_latitude
    get_location[:lat].to_s
  end 
  
  private

  def get_location
    get_location_json[:results].first[:geometry][:location]
  end
  
  def get_location_json
    response = google_conn.get
    JSON.parse(response.body, symbolize_names: true)
  end 

  def google_conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api/geocode/json') do |faraday|
      faraday.params['key'] = ENV['GOOGLE_API_KEY']
      faraday.params['address'] = "#{@city},#{@state}"
      faraday.adapter Faraday.default_adapter
    end 
  end 
end 