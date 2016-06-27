Rails.application.routes.draw do
  # resources :articles
  # resources :locations
  # resources :favourites
  resources :users do
    collection do 
      post 'token'
    end
  end
  
  resources :matches
  resources :played_games
  resources :games
  resources :wagers
end
