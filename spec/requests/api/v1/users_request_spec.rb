require 'rails_helper' 

 describe 'Users' do
  it 'creates a user' do
    email = 'email@meow.com'
    password = 'password'

    post '/api/v1/users', params: { 
                                  email: email, 
                                  password: password, 
                                  password_confirmation: password
                                }

    user = User.last
    
    expect(user.email).to eq(email)
    expect(user.password_digest).to_not be_nil
  end

  it 'receives an api key when it creates a user' do
    email = 'email@meow.com'
    password = 'password'

    post '/api/v1/users', params: { 
                                  email: email, 
                                  password: password, 
                                  password_confirmation: password
                                }
    expect(response.status).to eq(201)
    expected = JSON.parse(response.body, symbolize_names: true)

    expect(expected).to have_key(:api_key)

    user = User.last

    expect(user.api_key).to eq(expected[:api_key])
  end
end 