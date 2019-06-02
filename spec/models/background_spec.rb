require 'rails_helper' 

describe Background, type: :model do
  describe 'instance methods' do 
    it '.background_url' do
      background = Background.new('denver_co')

      expect(background.background_url).to be_a(String)
    end 
  end 
end 