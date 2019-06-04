require 'rails_helper'

describe Background, type: :model do
  describe 'instance methods' do
    it '.background_url' do
      background = Background.new('denver,co')

      expect(background.background_url).to be_a(String)
      expect(background.city).to eq('Denver')
      expect(background.state).to eq('CO')
    end
  end
end