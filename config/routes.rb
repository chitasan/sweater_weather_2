Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show', as: 'forecast'
      get '/backgrounds', to: 'backgrounds#show'
      
      resources :users
      resources :sessions
      resources :favorites
    end
  end
end
