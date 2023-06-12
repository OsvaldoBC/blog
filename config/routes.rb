Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/users',to: 'users#index', as: :users
  get '/users/:id', to: 'users#show', as: :user
  get '/users/:user_id/post', to: 'post#show', as: :user_post
end
