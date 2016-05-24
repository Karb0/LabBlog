Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root "posts#index"
  get "/posts/new" => 'posts#new'
  post "/posts" => 'posts#create'
  get "/post/:id" => 'posts#show', as: :post
end
