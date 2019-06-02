require 'rails_helper'

describe 'BackgroundService' do
  it 'exists' do 
    service = BackgroundService.new('Denver', 'CO')

    expect(service).to be_a(BackgroundService)
  end 

  
end 