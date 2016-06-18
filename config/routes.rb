Rails.application.routes.draw do
  # match '/api/todos' => "todos#options", via: :options

  namespace :api do
    resources :todos, except: [:new, :edit]
    resources :users, except: [:new, :edit]
    resources :articles, except: [:new, :edit]
  end
end
