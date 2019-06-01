require 'rails_helper'

describe Forecast do
  it 'can receive a forecast' do 
    get "/api/v1/forecast?location=denver,co"



   
  end 
end