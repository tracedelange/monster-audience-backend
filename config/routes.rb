Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/login', to: 'sessions#create'
  post '/signup', to: 'users#create'
  get '/me', to: 'users#me'


  get '/subjects/mine', to: 'subjects#mine'
  get '/reviews/mine', to: 'reviews#mine'
  
  resources :subjects do
    resources :reviews, only: [:show]
  end

  resources :reviews


end
