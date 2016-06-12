Rails.application.routes.draw do
  namespace :api do
    resources :articles, except: [:new, :edit]
  end
end
