require 'rails_helper'

describe 'LocationService' do
  it 'exists' do
    service = LocationService.new("Denver", "CO")

    expect(service).to be_a(LocationService)
  end

  # describe 'instance methods' do
  #   it '.get_longitude' do
  #     service = LocationService.new("Denver", "CO")
 
  #     expect(service.get_longitude).to eq('39.7392358')
  #   end 

  #   it '.get_latitude' do
  #     service = LocationService.new("Denver", "CO")
 
  #     expect(service.get_longitude).to eq('-104.990251')
  #   end 
  # end 
end 