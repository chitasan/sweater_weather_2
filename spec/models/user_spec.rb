require 'rails_helper'

describe User, type: :model do
  describe 'validations' do 
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
  end

  describe 'relationships' do
    it { should have_many :favorites }
  end 

  it 'creates api_key when user is created' do
    user = User.create(email: 'user@meow.com', password: 'password')
    
    expect(user.api_key).to_not be_nil
    expect(user.api_key).to be_a(String)
    expect(user.api_key.length).to eq(28)
  end 
end
