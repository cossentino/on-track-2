Rails.application.routes.draw do
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#sign_in_user'
  get '/signup', to: 'users#new'
  get '/logout', to: 'sessions#logout'
  get '/dashboard', to: 'users#dashboard'
  get '/users/:id', to: 'users#dashboard'
  get '/users', to: 'users#dashboard'
  match '/users/:user_id/purchases/:id/delete', to: 'purchases#destroy', via: [:get, :post], as: 'delete_user_purchase'
  resources :users, except: [:index, :show] do 
    resources :purchases
  end

  match '/auth/:provider/callback', to: 'sessions#oauth', via: [:get, :post]
  root 'sessions#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
