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
  
  resources :matches do
    collection do 
      get 'search/:game_type_id', action: "search"
    end
  end

  resources :games
  resources :wagers
end
