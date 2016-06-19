Rails.application.routes.draw do
  resources :articles
  resources :locations
  resources :favourites
  resources :users do
    collection do 
      post 'token'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
