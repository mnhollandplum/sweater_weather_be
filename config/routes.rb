Rails.application.routes.draw do

 root 'welcome#index'
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#index'
      post '/users', to: 'users#create'
    end
  end
end
