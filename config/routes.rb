Rails.application.routes.draw do
  namespace :api do
    resources :users, except: [:new, :edit]
    resources :articles, except: [:new, :edit]
  end
end
