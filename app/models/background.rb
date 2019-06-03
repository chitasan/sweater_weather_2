class Background
  attr_reader :city,
              :state
  
  def initialize(city_state)
    split_location = city_state.split(',')
    @city          = split_location[0].capitalize
    @state         = split_location[1].upcase
  end
  
  def background_url
    background_service.get_background
  end

  private

  def background_service
    @background_service ||= BackgroundService.new(@city, @state)
  end 
end