class Background
  attr_reader :city, :state
  
  def initialize(location)
    split_location = location.split(',')
    @city = split_location[0]
    @state = split_location[1]
  end
  
  def background_url
    background_service.get_background
  end

  private

  def background_service
    @background_service ||= BackgroundService.new(@city, @state)
  end 
end