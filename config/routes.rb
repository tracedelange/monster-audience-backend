Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/login', to: 'sessions#create'
  post '/signup', to: 'users#create'
  get '/me', to: 'users#me'
  get '/users/search', to: 'users#search'
  
  mount ActionCable.server => '/cable'
  
  get '/feed', to: 'feeds#index'
  get '/feed/:id', to: 'feeds#show'
  
  resources :conversations, only: [:index, :create, :destroy, :show]

  get '/subjects/mine', to: 'subjects#mine'
  get '/subjects/search', to: 'subjects#search'

  #subject query routes:
  get '/subjects/recent', to: 'subjects#recent'
  get '/subjects/popular', to: 'subjects#popular'
  get '/subjects/unpopular', to: 'subjects#unpopular'
  
  get '/reviews/mine', to: 'reviews#mine'

  resources :friendships, only: [:index, :create, :destroy]
  
  resources :subjects do
    resources :reviews, only: [:show]
  end

  resources :reviews


end
