Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'cards#index'

  # Cards
  get '/cards' => 'cards#index'

  get '/cards/:id' => 'cards#show'

  # Filters
  resources :filters

  # Users
  resources :users

  # Sessions
  get '/sessions/new' => 'sessions#new', as: 'new_session'
  post '/sessions' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'
end
