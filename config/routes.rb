Rails.application.routes.draw do
  use_doorkeeper
  resources :outcomes
  resources :moves do
  end
  resources :movers do 
    member do 
      patch 'reset', action: 'reset'
      get 'moves', action: 'moves'
    end
  end
  resources :game_types, :path => '/game_types'
  # resources :articles
  # resources :locations
  # resources :favourites
  resources :users do
    collection do
      get 'me'
      post 'token'
    end
  end
  
  resources :matches do
    collection do 
      get 'search/:game_type_id', action: "search"
    end
    member do 
      post 'winner', action: 'winner'
      post 'record_move', action: 'record_move'
    end
  end

  resources :games
  resources :wagers
end
