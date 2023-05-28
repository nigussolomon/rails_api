Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  post '/login', to: 'users#login'
  resources :profiles
  resources :todos
  get '/my_todos', to: 'todos#my_todos'
  # Defines the root path route ("/")
  # root "articles#index"
end
