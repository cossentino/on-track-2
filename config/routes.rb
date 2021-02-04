Rails.application.routes.draw do
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#sign_in_user'
  get '/signup', to: 'users#new'
  get '/logout', to: 'sessions#logout'
  get '/dashboard', to: 'users#dashboard'
  resources :users do 
    resources :purchases
  end

  match '/auth/:provider/callback', to: 'sessions#oauth', via: [:get, :post]
  root 'sessions#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
