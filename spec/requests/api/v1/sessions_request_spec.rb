require 'rails_helper'

 describe 'Sessions' do
  it 'returns an API key' do
    user = User.create(email: 'person@meow.com', password: 'password')

    post '/api/v1/sessions', params: {
                                      email: user.email,
                                      password: user.password,
                                      password_confirmation: user.password_confirmation
                                    }

    expect(response.status).to eq(200)
    expected = JSON.parse(response.body, symbolize_names: true)
                         
    expect(expected).to have_key(:api_key)
    expect(expected[:api_key]).to eq(user.api_key)
  end
end 
