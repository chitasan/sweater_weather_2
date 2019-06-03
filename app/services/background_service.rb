class BackgroundService
  attr_reader :city, :state
  
  ProjectWeatherGroupID= '1463451@N25'
  
  def initialize(city, state)
    @city  = city
    @state = state
  end
  
  def get_background
    "https://farm#{background_image[:farm]}.staticflickr.com/#{background_image[:server]}/#{background_image[:id]}_#{background_image[:secret]}_b.jpg"
  end
  
  private
  
  def background_image
    @background_image ||= get_background_images[:photo][random_background_generator]
  end
  
  def get_background_images(group_id = ProjectWeatherGroupID)
    @response ||= flickr_conn.get('/services/rest') do |faraday|
      faraday.params[:method] = 'flickr.groups.pools.getPhotos'
      faraday.params[:group_id] = group_id
      faraday.params[:tags] = "#{@city},#{@state}"
    end
    JSON.parse(@response.body, symbolize_names: true)[:photos]
  end
  
  def random_background_generator
    background_count = get_background_images[:total].to_i
    rand(0...background_count)
  end

  def flickr_conn
    Faraday.new(url: 'https://api.flickr.com') do |faraday|
      faraday.params['api_key'] = ENV['FLICKR_API_KEY']
      faraday.params['format'] = 'json'
      faraday.params['nojsoncallback'] = 1
      faraday.adapter Faraday.default_adapter
    end
  end
end