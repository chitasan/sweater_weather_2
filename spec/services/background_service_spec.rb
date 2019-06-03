require 'rails_helper'

describe 'BackgroundService' do
  it 'exists' do 
    service = BackgroundService.new('Denver', 'CO')

    expect(service).to be_a(BackgroundService)
  end

  it 'can get a background image' do
    service = BackgroundService.new('Denver', 'CO')
    background_image = service.get_background
    
    expect(background_image).to be_a(String)
  end 
end 