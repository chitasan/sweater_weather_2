class Background
  attr_reader :city, :state
  
  def initialize(location)
    split_location = location.split(',')
    @city = split_location[0]
    @state = split_location[1]
  end
  
  def background_url
    BackgroundService.new(@city, @state).get_background
  end
end