Rails.application.routes.draw do

  root 'sessions#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/signup', to: 'users#new'
  #don't need another route for post because it's already included in the routes 

  delete '/logout', to: 'sessions#destroy'


  resources :reviews
  resources :resources do 
    resources :reviews, only: [:new, :index]
  end
  resources :topics
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
