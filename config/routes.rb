Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'cards#index'

  # Cards
  get '/cards' => 'cards#index'

  get '/cards/:id' => 'cards#show'

  # patch favorites, forget the deck
end
