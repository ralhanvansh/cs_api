Rails.application.routes.draw do
  post '/users/register', to: "users#register"
  post '/users/login', to: "users#login"
  resources :categories
  resources :products
  resources :users do
    resource :cart
  end
end

