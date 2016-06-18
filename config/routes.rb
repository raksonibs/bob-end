Rails.application.routes.draw do
  resources :publishing_houses
  resources :authors
  resources :books
  # match '/api/todos' => "todos#options", via: :options

  namespace :api do
    resources :todos, except: [:new, :edit]
    resources :users, except: [:new, :edit]
    resources :articles, except: [:new, :edit]
  end
end
