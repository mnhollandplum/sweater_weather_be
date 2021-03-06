Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#index'
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'
      get '/gifs', to: 'gifs#index'
      post '/favorites', to: 'favorites#create'
      get '/favorites', to: 'favorites#index'
      delete '/favorites', to: 'favorites#destroy'
    end
  end
end
