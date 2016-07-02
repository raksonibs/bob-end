Rails.application.routes.draw do
  resources :game_types, :path => '/game-types'
  # resources :articles
  # resources :locations
  # resources :favourites
  resources :users do
    collection do 
      post 'token'
    end
  end
  
  resources :matches
  resources :games
  resources :wagers
end
